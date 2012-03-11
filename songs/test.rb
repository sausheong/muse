require "muse"
include Muse

Song.record 'test_file' do
  bar(1,b:0.5).notes { c4; e4; g4;}
  # bar(1,b:0.5).notes { c4; d4; e4;}

end
