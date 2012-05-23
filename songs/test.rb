require 'muse'
include Muse

Song.record 'test_file', bpm: 120, envelope: 'default', harmonic: 'guitar' do  
  bar(1,b:0.5).notes { c4}
  bar(2,b:0.5).notes { c4; e4;}
  bar(3,b:0.5).notes { g4 b: 1.5}
end
