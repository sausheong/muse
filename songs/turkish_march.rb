require "muse"
include Muse

# Mozart's Piano Sonata No. 11 3rd Movement (All Turca)
# more popularly known as the 'Turkish March' or 'Turkish Rondo'
# first 9 bars only

Song.record 'turkish_march' do
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
  bar(6,b:0.5).notes    {e3; b4_e4; b4_e4; b4_e4;}  
  
  bar(7,b:0.5).notes    {b5; fis5_a5; e5_g5; fis5_a5; }
  bar(7,b:0.5).notes    {e3; b4_e4; b4_e4; b4_e4;}  
  
  bar(8,b:0.5).notes    {b5; fis5_a5; e5_g5; dis5_eis5; }
  bar(8,b:0.5).notes    {e3; b4_e4; b2; b4;}  
  
  bar(9).notes          {e4}
  bar(9).notes          {e4}  
end
