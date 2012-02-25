require '../muse'

# Mozart's Piano Sonata No. 11 3rd Movement (All Turca)
# more popularly known as the 'Turkish March' or 'Turkish Rondo'
# first 9 bars only

Song.record 'turkish_march' do
  bar(1,o:1,b:0.25).notes   {b; a; gis o:0; a;}

  bar(2,o:1,b:0.25).notes   {c b:0.5; _ b:0.5; d; c; b; c;}
  bar(2,b:0.5).notes        {a; c_e; c_e; c_e;} 

  bar(3,o:1,b:0.25).notes   {e b:0.5; _ b:0.5; f; e; dis; e;}
  bar(3,b:0.5).notes        {a; c_e; c_e; c_e;}  

  bar(4,o:2,b:0.25).notes   {b; a; gis o:1; a; b; a; gis o:1; a;}
  bar(4,b:0.5).notes        {a; c_e; a; c_e;}  
  
  bar(5,o:2,b:0.5).notes    {c b:1; a; c;}
  bar(5,b:0.5).notes        {a; c_e; c_e; c_e;}  
  
  bar(6,o:1,b:0.5).notes    {b o:2; fis_a; e_g; fis_a; }
  bar(6,b:0.5).notes        {a; b_e; b_e; b_e;}  
  
  bar(7,o:1,b:0.5).notes    {b o:2; fis_a; e_g; fis_a; }
  bar(7,b:0.5).notes        {a; b_e; b_e; b_e;}    
  
  bar(8,o:1,b:0.5).notes    {b o:2; fis_a; e_g; dis_eis; }
  bar(8,b:0.5).notes        {a; b_e; b; b o:1;}  
  
  bar(9).notes              {e o:1}
  bar(9).notes              {e}  
end
