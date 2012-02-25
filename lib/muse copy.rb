require "#{File.dirname(__FILE__)}/wav"
require "#{File.dirname(__FILE__)}/config/adsr"
require "#{File.dirname(__FILE__)}/config/chords"

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
    attr :bpm, :beats, :octave, :adsr
    attr_accessor :stream
    
    NOTES = %w(_ a ais b c cis d dis e f fis g gis)
    FREQUENCIES = {
      :a2   => -24, :ais2 => -23, :b2   => -22,  :c2   => -21, :cis2 => -20, 
      :d2   => -19, :dis2 => -18, :e2   => -17,  :f2   => -16, :fis2 => -15, 
      :g2   => -14, :gis2 => -13, :a3   => -12,  :ais3 => -11, :b3   => -10, 
      :c3   => -9,  :cis3 => -8,  :d3   => -7,   :dis3 => -6,  :e3   => -5,  
      :f3   => -4,  :fis3 => -3,  :g3   => -2,   :gis3 => -1,  :a4   => 0,
      :ais4 => 1,   :b4   => 2,   :c4   => 3,    :cis4 => 4,   :d4   => 5, 
      :dis4 => 6,   :e4   => 7,   :f4   => 8,    :fis4 => 9,   :g4   => 10,   
      :gis4 => 11,  :a5   => 12,  :ais5 => 13,   :b5   => 14,  :c5   => 15,
      :cis5 => 16,  :d5   => 17,  :dis5 => 18,   :e5   => 19,  :f5   => 20,
      :fis5 => 21,  :g5   => 22,  :gis5 => 23
    }

    def initialize(id, options={})
      @bpm = options[:bpm] || 120
      @beats = (options[:b] || 1).to_f
      @octave = options[:o].to_i + 3
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
        if name.to_s.start_with? *NOTES
          note = name.to_s
          triad << note_data(note, options)
        end
      end
      triad.transpose.map {|x| x.transpose.map {|y| y.reduce(:+)}}   
    end

    def note_data(note, options={})
      stream = []
      if options
        beats  = options[:b].nil?  ? (@beats || 1) : options[:b].to_f
        volume = (options[:v].nil? ? 10 : options[:v].to_i) * 1000
        octave = options[:o].nil? ? @octave : options[:o].to_i + 3
        adsr = options[:a].nil? ? @adsr : 'default'
      else
        beats, volume, octave, adsr = (@beats || 1), 10000, @octave, 'default'
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
        x = (send(adsr.to_sym,i)*volume * Math.sin(2 * Math::PI * freq * i)).to_i
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
      if name.to_s.start_with? *NOTES
        note = name.to_s
        if note.split('_').length > 1
          notes = note.split('_')
          add_to_stream chord(notes, args[0])
        else
          add_to_stream note_data(note, args[0])
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