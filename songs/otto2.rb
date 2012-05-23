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
#
# Otto the Algorithmic Composer

require 'twitter'
require 'rest-client'
require 'muse'
include Muse

NOTES = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']
KEYPAD = {a:2,b:2,c:2,
          d:3,e:3,f:3,
          g:4,h:4,i:4,
          j:5,k:5,l:5,
          m:6,n:6,o:6,
          p:7,q:7,r:7,s:7,
          t:8,u:8,v:8,
          w:9,x:9,y:9,z:9}

MAJOR = { 0 => CircularList.new(%w(c4 d4 e4 f4 g4 a4 b4 c5 d5 e5 f5 g5 a5 b5)),
          1 => CircularList.new(%w(g3 a3 b3 c4 d4 e4 fis4 g4 a4 b4 c5 d5 e5 fis5)),
          2 => CircularList.new(%w(d4 e4 fis4 g4 a4 b4 cis5 d5 e5 fis5 g5 a5 b5 cis6)),
          3 => CircularList.new(%w(a3 b3 cis4 d4 e4 fis4 gis4 a4 b4 cis5 d5 e5 fis5 gis5)),
          4 => CircularList.new(%w(e4 fis4 gis4 a4 b4 cis5 dis5 e5 fis5 gis5 a5 b5 cis6 dis6)),
          5 => CircularList.new(%w(b3 cis4 dis4 e4 fis4 gis4 ais4 b4 cis5 dis5 e5 fis5 gis5 ais5)),
          6 => CircularList.new(%w(fis3 gis3 ais3 b3 cis4 dis4 f4 fis4 gis4 ais4 b4 cis4 dis4 f4))  }

class Array
  def counts
    inject(Hash.new(0)) do |hash,element|
      hash[ element ] +=1
      hash 
    end
  end
end

puts "== OTTO THE ALGORITHMIC COMPOSER =="
# Using Twitter as the source for text          
@text = Twitter.search("#reddot").last.text

# Use RText as the source for text
# text = RestClient.get "http://rtext.heroku.com/barsoom1"
# 
puts "Generating music from text: "
puts @text


# calculate the number of syllables in a word
def syllables(a_word)
  word = a_word.downcase
  return 1 if word.length <= 3
  word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
  word.sub!(/^y/, '')
  word.scan(/[aeiouy]{1,2}/).size
end

# convert a word to an integer using the number pad algorithm
def word_to_num(a_word)
  a_word.downcase.chars.inject(""){|memo,obj| memo + KEYPAD[obj.to_sym].to_s}
end

# find note given a word
def note(a_word)
  word_to_num(a_word).to_i % 11  
end


def distance(a_word)
  word_to_num(a_word).to_i % 5
end

def direction(a_word)
  (word_to_num(a_word).to_i % 2) == 0 ? 1 : -1
end

# Start composing!

words = @text.split

#
# get the scale
#
music = []
words.each do |w|
  music << NOTES[note(w)]
end

# sort the notes by the most frequently found notes
sorted = music.counts.sort_by {|obj| obj[1]}.reverse
# get the 7 most frequently used notes
most_frequent_7_notes = sorted.map {|obj| obj[0]}.first(7)
# calculate the number of sharps in the notes, to get the correct scale
num_of_sharps = most_frequent_7_notes.inject(0) { |memo, obj| obj.end_with?("is") ? memo + 1 : memo }
scale = MAJOR[num_of_sharps]

puts "Composing music to the scale of : #{scale[0].upcase.chop} Major"

# Getting the chord progression, using the I-IV-V progression
scale_chords = {}
scale_chords[0] = ["#{scale[0]}", "#{scale[2]}", "#{scale[4]}"]
scale_chords[1] = ["#{scale[3]}", "#{scale[5]}", "#{scale[7]}"]
scale_chords[2] = ["#{scale[4]}", "#{scale[6]}", "#{scale[8]}"]


# break down into 4 words per bar for parallel processing
quadruplets = []
until words.empty?
  quadruplets << words.pop(4)
end

Song.record 'ottobot_music', harmonic: 'guitar' do
  quadruplets.reverse.each_with_index do |quad, index|
    beats = 0.0
    bar(index).notes {      
      beats, bar_notes = [], []
      quad.each do |word|
        beats << syllables(word).to_f/2
        if direction(word) > 0
          bar_notes << scale.next(distance(word))
        else
          bar_notes << scale.previous(distance(word))
        end
      end   
      total_beats = beats.inject(:+)
      bar_notes.each_with_index do |n,i|
        note = n.chop
        octave = n[n.size-1]
        b = (beats[i]*4.0)/total_beats
        add_to_stream note_data(note, octave, b:b)    
      end         
    }

    bar(index, v:1.5).notes {
      ch = scale_chords[index % 3]
      chord = [ch[1], ch[2], ch[0]]
      add_to_stream note_data(ch[0].chop, 3, b:1)
      add_to_stream chord(chord, b:1)
      add_to_stream chord(chord, b:1)
      add_to_stream chord(chord, b:1)
    }
     
    # bar(index, v:3).notes {
    #   ch = scale_chords[index % 3]
    #   add_to_stream note_data(ch[0].chop, 3, b:0.5)
    #   add_to_stream note_data(ch[1].chop, 4, b:0.5)
    #   add_to_stream note_data(ch[2].chop, 4, b:0.5)
    #   add_to_stream note_data(ch[1].chop, 4, b:0.5)
    #   add_to_stream note_data(ch[0].chop, 4, b:0.5)
    #   add_to_stream note_data(ch[1].chop, 4, b:0.5)
    #   add_to_stream note_data(ch[2].chop, 4, b:0.5)
    #   add_to_stream note_data(ch[1].chop, 4, b:0.5)
    #   
    # }     
  end
end
