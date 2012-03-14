require "../lib/muse"
include Muse

Song.record 'test_file' do
  bar(1,b:0.5).notes { c4; e4;}
  bar(2,b:0.5).notes { d4; f4;}
  bar(3,b:0.5).notes { e4}

end
