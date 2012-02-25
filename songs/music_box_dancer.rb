require '../muse'

# "Music Box Dancer" is an instrumental piece by Canadian musician 
# Frank Mills that was an international hit in the late 1970s. It 
# features a piano theme that is accompanied by other instrumentation, 
# designed to resemble a music box. - from Wikipedia
# first 9 bars only

Song.record 'music_box_dancer' do
  bar(1,b:0.5).notes { c; e; g; e; c o:1; g; e; g; }
  bar(2,b:0.5).notes { c; e; g; e; c o:1; g; e; g; }
  bar(3,b:0.5).notes { c; e; g; e; c o:1; g; e; g; }
  
  bar(4,b:0.5).notes { _ b:3.5; c o:1; }
  bar(4,b:0.5).notes { c; e; g; e; c o:1; g; e; g; }
  
  bar(5,b:0.5).notes { c; e; g; c o:1; e; g; c o:1; g; }
  bar(5,b:0.5,o:1).notes { c; g; c; e; c; e; g; c; }
  
  bar(6,b:0.5).notes { c o: 2; b o:2; a o:2; g o:1; g o:1; _ b:1.5; }
  bar(6,b:0.5).notes { f; g; c o:1; f o:1; c; e; g; c o:1; }
  
  bar(7,b:0.5,o:1).notes { g; f; d; b; g o:0; b; d; f; }
  bar(7,b:0.5).notes { g o:-1; b; d; g; b; d; g; d; }  
  
  bar(8,b:0.5).notes {e o:1; c o:1; a o:2; g o:1; g o:1; _ b:1; c o:1; }
  bar(8,b:0.5).notes {c; e; c o:1; g; e; g; c o:1; g; }
  
  bar(9,b:0.5,o:1).notes {c; g o:0; e; c; c; _ b:1; c;}
  bar(9,b:0.5).notes {c; e; g; c o:1; e; g; c o:1; g o:-1;}
end
