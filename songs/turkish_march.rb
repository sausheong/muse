require '../muse'

# Mozart's Piano Sonata No. 11 3rd Movement (All Turca)
# more popularly known as the 'Turkish March' or 'Turkish Rondo'
# first 9 bars only

Song.record 'turkish_march' do
  bar(1,b:0.25).notes   {b4; a4; gis3; a4;}

  bar(2,b:0.25).notes   {c4 b:0.5; _ b:0.5; d4; c4; b4; c4;}
  bar(2,b:0.5).notes    {a3; c3_e3; c3_e3; c3_e3;} 

  bar(3,b:0.25).notes   {e4 b:0.5; _ b:0.5; f4; e4; dis4; e4;}
  bar(3,b:0.5).notes    {a3; c3_e3; c3_e3; c3_e3;}  

  bar(4,b:0.25).notes   {b5; a5; gis4; a5; b5; a5; gis4; a5;}
  bar(4,b:0.5).notes    {a3; c3_e3; a3; c3_e3;}  
  
  bar(5,b:0.5).notes    {c5 b:1; a5; c5;}
  bar(5,b:0.5).notes    {a3; c3_e3; c3_e3; c3_e3;}  
  
  bar(6,b:0.5).notes    {b5; fis4_a4; e4_g4; fis4_a4; }
  bar(6,b:0.5).notes    {a3; b3_e3; b3_e3; b3_e3;}  
  
  bar(7,b:0.5).notes    {b5; fis4_a4; e4_g4; fis4_a4; }
  bar(7,b:0.5).notes    {a3; b3_e3; b3_e3; b3_e3;}    
  
  bar(8,b:0.5).notes    {b5; fis4_a4; e4_g4; dis4_eis4; }
  bar(8,b:0.5).notes    {a3; b3_e3; b; b4;}  
  
  bar(9).notes          {e4}
  bar(9).notes          {e3}  
end
