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

MAJOR = { 0 => %w(c d e f g a b c d),
          1 => %w(g a b c d e fis g a),
          2 => %w(d e fis g a b cis d e),
          3 => %w(a b cis d e fis gis a b),
          4 => %w(e fis gis a b cis dis e fis),
          5 => %w(b cis dis e fis gis ais b cis),
          6 => %w(fis gis ais b cis dis f fis gis)  }

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
text = Twitter.search("ruby", :lang => "en").last.text

# Use RText as the source for text
text = RestClient.get "http://rtext.heroku.com/barsoom1"

puts "Generating music from text: "
puts text


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

# Start composing!

words = text.split
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

puts "Composing music to the scale of : #{scale[0].upcase} Major"

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


Song.record 'otto_music', harmonic: 'guitar' do
  quadruplets.reverse.each_with_index do |quad, index|
    
    bar(index).notes {      
      quad.each do |word|
        note = NOTES[note(word)]
        beat = syllables(word).to_f/2
        add_to_stream note_data(note, 4, b:beat)
      end      
    }
     
    bar(index).notes {
      ch = scale_chords[index % 3]
      add_to_stream note_data(ch[0], 3, b:0.5)
      add_to_stream note_data(ch[1], 4, b:0.5)
      add_to_stream note_data(ch[2], 4, b:0.5)
      add_to_stream note_data(ch[1], 4, b:0.5)
      add_to_stream note_data(ch[0], 4, b:0.5)
      add_to_stream note_data(ch[1], 4, b:0.5)
      add_to_stream note_data(ch[2], 4, b:0.5)
      add_to_stream note_data(ch[1], 4, b:0.5)            
    }     
  end
end

