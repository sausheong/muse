require "muse"
include Muse

Song.record 'beauty', bpm: 70, envelope: 'sine', harmonic: 'organ' do
  bar(1, b:0.5).notes  {a4; c5; e5; f5 b:1; ais4 b:1.5; a5; ais5; g5; a5;}
  bar(1, b:0.5).notes  {a3 b:2;       ais3; d4; f4; ais4; c5 b:1; e4 b:1;}
  
  bar(2, b:0.5).notes  {a4_f5 b: 2; a4 b:1; c5 b:0.33; e5 b:0.33; f5 b:0.33; }
  bar(2, b:0.5).notes  {f3; c3; g3; a3 b:2.5;}
  
  bar(3, b:0.5).notes  {ais4_g5 b: 2;  a5; ais5; g5; a5;}
  bar(3, b:0.5).notes  {f2; d3; f3; ais3 b:1.5; e b:1}
  
  bar(4, b:0.5).notes  {a4_f5 b:2; f4; g4; a4; ais4; }
  bar(4, b:0.5).notes  {f3; c3; g3; a3 b:2.5;}
  
  bar(5, b:0.5).notes  {e4_c5 b:2; c5 b:0.75; ais4 b:0.25; a4 b:0.75; g4 b: 0.25;}
  bar(5, b:0.5).notes  {a3; g3; f3; g3 b:2.5;}
  
  bar(6, b:0.5).notes  {f4 b:2; ais4 b:1; a4 b:0.33; g4 b:0.33; f4_d4 b:0.83; c4 b: 2.5; c4_e4 b:1}
  bar(6, b:0.5).notes  {ais2; d3; f3; ais3; d3_ais3 b:2; c3 b:1; ais2; c3; f3 b:1; e3 b:1;}
  
   
end