require '../muse'

# "Music Box Dancer" is an instrumental piece by Canadian musician 
# Frank Mills that was an international hit in the late 1970s. It 
# features a piano theme that is accompanied by other instrumentation, 
# designed to resemble a music box. - from Wikipedia
# first 9 bars only

Song.record 'music_box_dancer' do
  bar(1,b:0.5).notes { c3; e3; g3; e3; c4; g3; e3; g3; }
  bar(2,b:0.5).notes { c3; e3; g3; e3; c4; g3; e3; g3; }
  bar(3,b:0.5).notes { c3; e3; g3; e3; c4; g3; e3; g3; }
  
  bar(4,b:0.5).notes { _ b:3.5; c4; }
  bar(4,b:0.5).notes { c3; e3; g3; e3; c4; g3; e3; g3; }
  
  bar(5,b:0.5).notes { c4; g3; c4; e4; c4; e4; g4; c4; }
  bar(5,b:0.5).notes { c3; e3; g3; c4; e3; g3; c4; g3; }

  
  bar(6,b:0.5).notes { c5; b5; a5; g4 b:1; _ b:1.5; }
  bar(6,b:0.5).notes { f3; g3; c4; f4; c3; e3; g3; c4; }
  
  bar(7,b:0.5).notes { g4; f4; d4; b4; g3; b4; d4; f4; }
  bar(7,b:0.5).notes { g2; b3; d3; g3; b3; d3; g3; d3; }  
  
  bar(8,b:0.5).notes {e4; c4; a5; g4 b:1; _ b:1; c4; }
  bar(8,b:0.5).notes {c3; e3; c4; g3; e3; g3; c4; g3; }
  
  bar(9,b:0.5).notes {c4; g3; c4; e4; c4; e4; g4; c4;}
  bar(9,b:0.5).notes {c3; e3; g3; c4; e3; g3; c4; g3;}
end
