# Muse
# Copyright (C) 2012  Chang Sau Sheong
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require "parallel"
require "#{File.dirname(__FILE__)}/muse/wav"
require "#{File.dirname(__FILE__)}/muse/config"
require "#{File.dirname(__FILE__)}/muse/circularlist"

module Muse
  
      
  NOTES = %w(_ a ais b c cis d dis e f fis g gis)
  FREQUENCIES = {
    :ais1 => -34, :b1   => -33, :cis2 => -32,  :d2   => -31, :dis2 => -30,
    :e2   => -29, :f2   => -28, :fis2 => -27,  :g2   => -26, :gis2 => -25,
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
    
  class Song

    def self.record(name, options ={}, &block)
      start_time = Time.now
      puts "Start recording song named #{name}.wav"
      @name = name
      @bpm = options[:bpm] || 120
      @envelope = options[:envelope] || 'default'
      @harmonic = options[:harmonic] || 'default'
      @bars = {}
      puts "Processing ..."
      instance_eval &block
      save
      end_time = Time.now
      puts "Total time taken : #{((end_time - start_time)/60.0).round(3)} minutes"  
      puts "done."
    end

    class Bar
      attr :bpm, :beats, :envelope, :harmonic
      attr_accessor :stream


      def initialize(id, options={})
        @bpm = options[:bpm] || 120
        @beats = (options[:b] || 1).to_f
        @envelope = options[:e] || 'default'
        @harmonic = options[:h] || 'default'
        @volume = options[:v] || 5
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
          volume = (options[:v].nil? ? (@volume.to_i || 5) : options[:v].to_i) * 1000
          envelope = options[:a].nil? ? @envelope : 'default'
          harmonic = options[:h].nil? ? @harmonic : 'default'
        else
          beats, volume, envelope, harmonic = (@beats || 1), 5000, @envelope || 'default', @harmonic || 'default'
        end
        puts "[#{note}] -> b:#{beats}, o:#{octave}, e:#{envelope}, h:#{harmonic}"
        duration = ((60 * WavHeader::SAMPLE_RATE * beats)/@bpm)/WavHeader::SAMPLE_RATE.to_f
        note_frequency = note + octave.to_s
        unless note == '_'
          freq = frequency_of(FREQUENCIES[note_frequency.to_sym])
        else
          freq = 0
        end      
        (0.0..duration.to_f).step(1.0/WavHeader::SAMPLE_RATE) do |i|
          env = Envelope.send(envelope.to_sym,i, duration)
          har = Harmonic.send(harmonic.to_sym, freq * i)
          x = (env * volume * har).to_i
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
        puts "bar #{id} - bpm:#{@bpm}"
        unless @bars[id]
          @bars[id] = []
        end
        options[:bpm] = options[:bpm] || @bpm || 120
        options[:envelope] = options[:envelope] || @envelope || 'default'
        options[:harmonic] = options[:harmonic] || @harmonic || 'default'
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
        puts "\nCreating temporary files in parallel ..."

        results = Parallel.each_with_index(@bars.values, :in_processes => Parallel.processor_count) do |item, id|
          puts "Writing file #{id}"
          stream = []
          container = []
          item = right_size item
          item.each do |i|
            container << i.stream
          end
          stream += container.transpose.map {|x| x.transpose.map {|y| y.reduce(:+)}}
          temp = TempData.new
          stream.each_with_index do |s,i|
            temp.stream[i].left = s[0]
            temp.stream[i].right = s[1]
          end          
          File.open("#{@name}-#{id.to_s.rjust(3,'0')}.tmp", "w") {|file| temp.write(file) }
          puts "file #{id} done."
        end

        stream_size = results.inject(0) do |memo, bars|
          memo + bars.first.stream.size
        end

        print "\nCombining temporary files ..."
        WavHeader.new("#{@name}.wav", stream_size)
        tmpfiles = Dir.glob("#{@name}-*.tmp").sort
        File.open("#{@name}.wav", "ab+") do |wav|
          tmpfiles.each do |file|
            File.open(file, "rb") { |tmp| File.copy_stream(tmp, wav) }
            File.delete file
          end
        end
        puts " done."
      end
    end
  end
end
