$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require "muse"
include Muse

# Mozart's Piano Sonata No. 11 3rd Movement (All Turca)
# more popularly known as the 'Turkish March' or 'Turkish Rondo'
# first 9 bars only

Song.record 'turkish_march', envelope: 'default', harmonic: 'organ'  do
  bar(1,b:0.25).notes   {b4; a4; gis4; a4;}

  bar(2,b:0.25).notes   {c5 b:0.5; _ b:0.5; d5; c5; b4; c5;}
  bar(2,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

  bar(3,b:0.25).notes   {e5 b:0.5; _ b:0.5; f5; e5; dis5; e5;}
  bar(3,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

  bar(4,b:0.25).notes   {b5; a5; gis5; a5; b5; a5; gis5; a5;}
  bar(4,b:0.5).notes    {a3;     c4_e4;    a3;     c4_e4;}  

  bar(5,b:0.5).notes    {c6 b:1;            a5;     c6;}
  bar(5,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

  bar(6,b:0.5).notes    {b5; fis5_a5; e5_g5; fis5_a5; }
  bar(6,b:0.5).notes    {e3 v:13; b3_e4; b3_e4; b3_e4;}  

  bar(7,b:0.5).notes    {b5; fis5_a5; e5_g5; fis5_a5; }
  bar(7,b:0.5).notes    {e3 v:13; b3_e4; b3_e4; b3_e4;}  

  bar(8,b:0.5).notes    {b5; fis5_a5; e5_g5; dis5_eis5; }
  bar(8,b:0.5).notes    {e3 v:13; b3_e4; b2; b3;}  

  bar(9).notes          {e5}
  bar(9).notes          {e4}  

  bar(10,b:0.5).notes   {c5_e5; d5_f5;}

  bar(11,b:0.5).notes   {e5_g5; e5_g5; a5 b:0.25; g5 b:0.25; f5 b:0.25; e5 b:0.25;}
  bar(11,b:0.5).notes   {c3; c4; e3; e4;}

  bar(12,b:0.5).notes   {b4_d5; g4; c5_e5; d5_e5;}
  bar(12,b:0.5).notes   {g3; _ b:2;}

  bar(13,b:0.5).notes   {e5_g5; e5_g5; a5 b:0.25; g5 b:0.25; f5 b:0.25; e5 b:0.25;}
  bar(13,b:0.5).notes   {c3; c4; e3; e4;}

  bar(14,b:0.5).notes   {b4_d5 b:1; a4_c5; b4_d5;}
  bar(14,b:0.5).notes   {g3; _ b:2;}

  bar(15,b:0.5).notes   {c5_e5; c5_e5; f5 b:0.25; e5 b:0.25; d5 b:0.25; c5 b:0.25;}
  bar(15,b:0.5).notes   {a2; a3; c3; c4;}

  bar(16,b:0.5).notes   {gis4_b4; e4; a4_c5; b4_d5;}
  bar(16,b:0.5).notes   {e3; _ b:2;}

  bar(17,b:0.5).notes   {c5_e5; c5_e5; f5 b:0.25; e5 b:0.25; d5 b:0.25; c5 b:0.25;}
  bar(17,b:0.5).notes   {a2; a3; c3; c4;}

  bar(18,b:0.5).notes   {gis4_b4 b:1; b4 b:0.25; a4 b:0.25; gis4 b:0.25; a4 b:0.25;}
  bar(18,b:0.5).notes   {e3; _ b:2;}

  bar(19,b:0.25).notes   {c5 b:0.5; _ b:0.5; d5; c5; b4; c5;}
  bar(19,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

  bar(20,b:0.25).notes   {e5 b:0.5; _ b:0.5; f5; e5; dis5; e5;}
  bar(20,b:0.5).notes    {a3;       c4_e4;   c4_e4;  c4_e4;} 

  bar(21,b:0.25).notes   {b5; a5; gis5; a5; b5; a5; gis5; a5;}
  bar(21,b:0.5).notes    {a3;     c4_e4;    a3;     c4_e4;}

  bar(22,b:0.5).notes    {c6 b:1;  a5; b5;} 
  bar(22,b:0.5).notes    {f3; a3_dis4; a3_dis4; a3_dis4;}

  bar(23,b:0.5).notes    {c6; b5; a5; gis5;}
  bar(23,b:0.5).notes    {e3; a3_e4; d3; f3_b3;}

  bar(24,b:0.5).notes    {a5; e5; f5; d5;}
  bar(24,b:0.5).notes    {c3; e3_a3; d3; f3_b3;}

  bar(25,b:0.0833).notes {c5 b:1; b4;c5;b4;c5;b4;c5;b4;c5;b4; a4 b:0.125; b4 b:0.125;}
  bar(25,b:0.5).notes    {e3_a3; e3_a3; e3_gis3; e3_gis3;}

  bar(26,b:1).notes      {a4}
  bar(26,b:1).notes      {a2_a3}
   
  
end
