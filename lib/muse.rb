require "muse/wav"
require "muse/config"

module Muse
  class Song
    attr :wav_file, :bars

    def self.record(name, &block)
      puts "Start recording song named #{name}.wav"
      @wav_file = Wav.new(name + ".wav")
      @bars = {}
      puts "Processing ..."
      instance_eval &block
      save
      puts "done."
    end

    class Bar
      attr :bpm, :beats, :adsr
      attr_accessor :stream
      
      NOTES = %w(_ a ais b c cis d dis e f fis g gis)
      FREQUENCIES = {
        :a2   => -24, :ais2 => -23, :b2   => -22,  :c3   => -21, :cis3 => -20, 
        :d3   => -19, :dis3 => -18, :e3   => -17,  :f3   => -16, :fis3 => -15, 
        :g3   => -14, :gis3 => -13, :a3   => -12,  :ais3 => -11, :b3   => -10, 
        :c4   => -9,  :cis4 => -8,  :d4   => -7,   :dis4 => -6,  :e4   => -5,  
        :f4   => -4,  :fis4 => -3,  :g4   => -2,   :gis4 => -1,  :a4   => 0,
        :ais4 => 1,   :b4   => 2,   :c5   => 3,    :cis5 => 4,   :d5   => 5, 
        :dis5 => 6,   :e5   => 7,   :f5   => 8,    :fis5 => 9,   :g5   => 10,   
        :gis5 => 11,  :a5   => 12,  :ais5 => 13,   :b5   => 14,  :c6   => 15,
        :cis6 => 16,  :d6   => 17,  :dis6 => 18,   :e6   => 19,  :f6   => 20,
        :fis6 => 21,  :g6   => 22,  :gis6 => 23
      }

      def initialize(id, options={})
        @bpm = options[:bpm] || 120
        @beats = (options[:b] || 1).to_f
        @adsr = options[:adsr] || 'default'
        @stream = []
      end

      def notes(&block)
        instance_eval &block
      end    

      def frequency_of(step)
        440.0*(2**(step.to_f/12.0))
      end

      def chord(notes,options={})
        puts "chord with #{notes}"
        triad =[]
        notes.each do |name|
          if name.start_with? *NOTES
            octave = name[name.length-1].to_i
            note = octave > 0 ? name.chop : name
            octave = 3 if octave == 0
            triad << note_data(note, octave, options)
          end
        end
        triad.transpose.map {|x| x.transpose.map {|y| y.reduce(:+)}}   
      end

      def note_data(note, octave=3, options={})
        stream = []
        if options
          beats  = options[:b].nil?  ? (@beats || 1) : options[:b].to_f
          volume = (options[:v].nil? ? 10 : options[:v].to_i) * 1000
          adsr = options[:a].nil? ? @adsr : 'default'
        else
          beats, volume, adsr = (@beats || 1), 10000, 'default'
        end
        puts "[#{note}] -> beats : #{beats}, :octave : #{octave}"
        duration = ((60 * Wav::SAMPLE_RATE * beats)/@bpm)/Wav::SAMPLE_RATE.to_f
        note_frequency = note + octave.to_s
        unless note == '_'
          freq = frequency_of(FREQUENCIES[note_frequency.to_sym])
        else
          freq = 0
        end      
        (0.0..duration.to_f).step(1.0/Wav::SAMPLE_RATE) do |i|
          x = (Config.send(adsr.to_sym,i) * volume * Math.sin(2 * Math::PI * freq * i)).to_i
          stream << [x,x]
        end  
        return stream           
      end

      def truncate_stream_by(num)
        num.times {@stream.pop}
      end

      def add_to_stream(str)
        @stream += str
      end

      def method_missing(name, *args, &block)
        name = name.to_s
        if name.start_with? *NOTES   
          if name.split('_').length > 1
            notes = name.split('_')
            add_to_stream chord(notes, args[0])
          else
            octave = name[name.length-1].to_i
            note = octave > 0 ? name.chop : name
            octave = 3 if octave == 0
            add_to_stream note_data(note, octave, args[0])
          end
        end
      end
    end

    private
    class << self
      def bar(id, options={})
        puts "bar #{id}"
        unless @bars[id]
          @bars[id] = []
        end
        @bars[id] << Bar.new(id, options)
        @bars[id].last
      end
      
      def right_size(bars)
        container = []
        min_bar = bars.min_by {|x| x.stream.length}
        bars.map do |bar|
          bar.truncate_stream_by(bar.stream.length - min_bar.stream.length)
          bar
        end
      end

      def save
        puts "Saving music file"
        stream = []
        @bars.each do |id, item|
          container = []
          item = right_size item
          item.each do |i|
            container << i.stream
          end
          stream += container.transpose.map {|x| x.transpose.map {|y| y.reduce(:+)}}   
        end
        @wav_file.write(stream)
        @wav_file.close
      end
    end
  end
end
