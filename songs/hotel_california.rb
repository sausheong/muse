require "muse"
include Muse

Song.record 'hotel_california', harmonic: 'organ', bpm: 100  do
  
  # define the chords
  def _Bm7(num)
    bar(num,b:0.5).notes {b2; fis3 b:0.25; b3 b:0.25; d4; b3; fis4;fis3 b:1; _;}
  end
  def _Bm7_strum(num)
    bar(num,b:0.33).notes {fis5; d5; b4; fis5; d5; b4; fis5; d5; b4; fis5 b:1; }
  end
  
  def _Fism(num)
    bar(num,b:0.5).notes {fis2; cis3 b:0.25; ais3 b:0.25; cis4; ais3; fis4; cis3 b:1;_;}
  end
  def _Fism_strum(num)
    bar(num,b:0.33).notes {fis5; cis5; ais4; fis5; cis5; ais4; fis5 b:2}
  end  
  
  def _AM(num)
    bar(num,b:0.5).notes {a2; e3 b:0.25; a3 b:0.25; cis4; a3; e4;e3 b:1; _;}
  end
  def _AM_strum(num)
    bar(num,b:0.33).notes {e5; cis5; a4; e5; cis5; a4; e5; cis5; a4; e5 b:1;}
  end  
  
  def _EM9(num)
    bar(num,b:0.5).notes {e2; b2 b:0.25; gis3 b:0.25; b3; gis3; e4; b2 b:1; _;}
  end
  def _EM9_strum(num)
    bar(num,b:0.33).notes {e5; b4; gis4; e5; b4; gis4; e5 b:2;}
  end  
  
  def _GM(num)
    bar(num,b:0.5).notes {g2; d3 b:0.25; g3 b:0.25; b3; g3; d4; d3 b:1; _;}
  end
  def _GM_strum(num) 
    bar(num,b:0.33).notes {d5; b4; g4; d5; b4; g4; d5; b4; g4; d5 b:1;}
  end
    
  def _DM(num)
    bar(num,b:0.5).notes {d3; fis3 b:0.25; a3 b:0.25; d4; a3; fis4; fis3 b:1; _;}
  end
  def _DM_strum(num)
    bar(num,b:0.33).notes {fis5; d5; a4; fis5; d5; a4; fis5 b:2;}
  end  
  
  def _Em7(num) 
    bar(num,b:0.5).notes {e2; b2 b:0.25; g3 b:0.25; b3; g3; e4; b2 b:1; _;}
  end
  def _Em7_strum(num) 
    bar(num,b:0.33).notes {e5; b4; g4; e5; b4; g4; e5; b4; g4; e5 b:1;}
  end  
  
  def _FisM7(num)
    bar(num,b:0.5).notes {fis2; cis3 b:0.25; ais3 b:0.25; cis4; ais3; fis4; cis3 b:1; _;} 
  end
  def _FisM7_strum(num)
    bar(num,b:0.33).notes {fis5; cis5; ais4; fis5; cis5; ais4; fis5 b:2;}
  end  
  
  # intro riff

  _Bm7('0a')
  
  _Fism('0b')
  
  _AM('0c')
  
  _EM9('0d')
  
  _GM('0e')
  
  _DM('0f')
  
  _Em7('0g')
  
  _FisM7('0h')

  _Bm7(1)
  bar(1,b:1,h:'third').notes { d4 b:2; e4; fis4;}
  
  _Fism(2)
  bar(2,b:1,h:'third').notes { e4 b:1.5; d4 b:0.5; cis4 b:2;}
  
  _AM(3)
  bar(3,b:1,h:'third').notes { cis4 b:2; d4; e4;}
  
  _EM9(4)
  bar(4,b:4,h:'third').notes { b3;}
  
  _GM(5)
  bar(5,b:1,h:'third').notes { b3 b:2; cis4; d4;}
  
  _DM(6)
  bar(6,b:1,h:'third').notes { a3 b:1.5; d4 b:2.5;}
  
  _Em7(7)
  bar(7,b:1,h:'third').notes { e4 b:2; fis4; g4;}
  
  _FisM7(8)
  bar(8,b:1,h:'third').notes { fis4 b:0.08; e4 b:0.08; fis4 b:3.84;}
  
  # start of song
  
  bar(9,b:0.25).notes {_ b:0.5; fis5; fis5; fis5 b:0.5; fis5; fis5; e5 b:0.5; fis5 b:0.5; _ b:1; } 
  bar(9,b:0.25).notes {_ b:0.5; a3_d4_fis4; fis4; fis4 b:0.5; fis4; fis4; a3_d4_e4 b:0.5; fis4 b:1.5;} 
  _Bm7(9)
  
  bar(10,b:0.25).notes  {_ b:0.5; fis5 b:0.5; fis5; fis5; fis5; e5 b:0.5; e5 b:2.25; }
  bar(10,b:0.25).notes  {_ b:0.5; ais3_cis4_fis4 b:0.5; fis4 b:0.33; e4 b:0.33; e4 b:0.33; e4 b:2;}
  _Fism(10)
  
  bar(11,b:0.25).notes {_ b:0.5; fis5 b:0.5;        fis5; e5; e5; e5; e5 b:0.5; fis5 b:0.5; _ b:1;} 
  bar(11,b:0.25).notes {_ b:0.5; a3_c4_fis4 b:0.5; fis4; e4; e4; e4; e4 b:0.5; fis4 b:1.5;} 
  _AM(11)
  
  bar(12,b:0.25).notes {_ b:0.5; fis5; fis5; fis5 b:0.33; e5 b:0.33; e5 b:0.33; e5 b:0.5; d5 b:0.5; _ b:1}   
  bar(12,b:0.25).notes {_ b:0.5; gis3_b3_fis4; fis4; fis4 b:0.33; e4 b:0.33; e4 b:0.33; e4 b:0.5; d4 b:1.5;}   
  _EM9(12)
  
  bar(13,b:0.25).notes {_ b:0.5; g5; g5; g5; fis5; e5; d5; d5 b:0.5; fis5 b:0.5; _ b:1;}   
  bar(13,b:0.25).notes {_ b:0.5; b3_d4_g4; g4; g4; fis4; e4; d4; b3_d4 b:0.5; fis4 b:1.5;}   
  _GM(13)
  
  bar(14,b:0.25).notes {_; d5; fis5; fis5; fis5 b:0.33; e5 b:0.33; d5 b:0.33; d5 b:1; _ b:1;}
  bar(14,b:0.25).notes {_; a3_d4; fis4; fis4; fis4 b:0.33; e4 b:0.33; d4 b:0.33; d4 b:2;}
  _DM(14)
  
  bar(15,b:0.25).notes {_; g4; e5; e5; e5; e5; d5; e5 b:0.5; d5; e5 b:1.25;}
  bar(15,b:0.25).notes {_; e3; e4; e4; g3_b3_e4; e4; e4; d4; e4 b:0.5; d4; fis4 b:1.25;}
  _Em7(15)
  
  bar(16,b:0.25).notes {_; fis4; fis5; fis5; fis5 b:0.5; a5 b:0.5; fis5 b:1; _ b:1;}
  bar(16,b:0.25).notes {_; fis3; ais3_cis4_fis4; fis4; fis4 b:0.5; e4; e4; ais3_cis4_fis4 b:2;}
  _FisM7(16)
  
  # chorus 
  
  bar(17,b:0.25).notes { _ b:0.5; g5; g5 b:0.5; g5; g5; g5 b:0.5; g5; b;0.75; a5 b:0.5; g5; g5}
  bar(17,b:0.25).notes { _ b:0.5; b3_d4_b4; b4 b:0.5; b4; b4; b4 b:0.5; b4 b:0.75; a4 b:0.5; g4; a3_d4_g4; }
  _GM(17)
  
  bar(18,b:0.25).notes { g5; fia5 b:0.75; _ b:2.5; fis5; fis5; }
  bar(18,b:0.25).notes { a3_d4_g4; fis4 b:3.25; fis4; fis4;}
  _DM(18)
  
  bar(19,b:0.25).notes { fis5; e5; e5; e5 b:1.25; _ b:1.5; e5; e5;}
  bar(19,b:0.25).notes { ais3_cis4_fis4; e4; e4; e4 b:2.75; e4; e4;}
  _FisM7(19)
  
  bar(20,b:0.25).notes { e5; d5; d5; d5 b:1.25; _ b:2;}
  bar(20,b:0.25).notes { fis3_ais3_e4; d4; d4; d4 b:3.25}
  _Bm7(20)
  
  bar(21,b:0.25).notes { g5; g5; g5; g5 b:0.5; g5 b:0.5; g5; g5 b:0.5; g5 b:0.5; a5 b:0.5; g5; g5; }
  bar(21,b:0.25).notes { b3_d4_b4; b4; b4; b4; b4 b:0.5; b4 b:0.5; b4 b:0.25; b4 b:0.5; b4 b:0.5; a4 b:0.5; g4; a3_d4_g4; }
  _GM(21)
  
  bar(22,b:0.25).notes { g5; fis5 b:0.75; _ b:2.5; e5; fis5;}
  bar(22,b:0.25).notes { a3_d4_g4; fis4 b:3.25; e4; fis4;}
  _DM(22)
  
  bar(23,b:0.25).notes { fis5; e5; e5; e5 b:1.25; _ b:1.5; e5; g5;}
  bar(23,b:0.25).notes { g3_b3-fis4; e4; e4; e4 b:2.75; e4; g4;}
  _Em7(23)
  
  bar(24,b:0.25).notes { g5; fis5; fis5; fis5 b:1.25; _ b:2;}
  bar(24,b:0.25).notes { ais3_e4_g4; fis4; fis4; fis4 b:3.25;}
  _FisM7(24)
  
  # repeat chorus
  
  bar(17,b:0.25).notes { _ b:0.5; g5; g5 b:0.5; g5; g5; g5 b:0.5; g5; b;0.75; a5 b:0.5; g5; g5}
  bar(17,b:0.25).notes { _ b:0.5; b3_d4_b4; b4 b:0.5; b4; b4; b4 b:0.5; b4 b:0.75; a4 b:0.5; g4; a3_d4_g4; }
  _GM(17)
  
  bar(18,b:0.25).notes { g5; fia5 b:0.75; _ b:2.5; fis5; fis5; }
  bar(18,b:0.25).notes { a3_d4_g4; fis4 b:3.25; fis4; fis4;}
  _DM(18)
  
  bar(19,b:0.25).notes { fis5; e5; e5; e5 b:1.25; _ b:1.5; e5; e5;}
  bar(19,b:0.25).notes { ais3_cis4_fis4; e4; e4; e4 b:2.75; e4; e4;}
  _FisM7(19)
  
  bar(20,b:0.25).notes { e5; d5; d5; d5 b:1.25; _ b:2;}
  bar(20,b:0.25).notes { fis3_ais3_e4; d4; d4; d4 b:3.25}
  _Bm7(20)
  
  bar(21,b:0.25).notes { g5; g5; g5; g5 b:0.5; g5 b:0.5; g5; g5 b:0.5; g5 b:0.5; a5 b:0.5; g5; g5; }
  bar(21,b:0.25).notes { b3_d4_b4; b4; b4; b4; b4 b:0.5; b4 b:0.5; b4 b:0.25; b4 b:0.5; b4 b:0.5; a4 b:0.5; g4; a3_d4_g4; }
  _GM(21)
  
  bar(22,b:0.25).notes { g5; fis5 b:0.75; _ b:2.5; e5; fis5;}
  bar(22,b:0.25).notes { a3_d4_g4; fis4 b:3.25; e4; fis4;}
  _DM(22)
  
  bar(23,b:0.25).notes { fis5; e5; e5; e5 b:1.25; _ b:1.5; e5; g5;}
  bar(23,b:0.25).notes { g3_b3-fis4; e4; e4; e4 b:2.75; e4; g4;}
  _Em7(23)
  
  bar(24,b:0.25).notes { g5; fis5; fis5; fis5 b:1.25; _ b:2;}
  bar(24,b:0.25).notes { ais3_e4_g4; fis4; fis4; fis4 b:3.25;}
  _FisM7(24)
  
  # repeat
  
  bar(33,b:0.25).notes {_ b:0.5; fis5; fis5; fis5 b:0.5; fis5; fis5; e5 b:0.5; fis5 b:0.5; _ b:1; } 
  bar(33,b:0.25).notes {_ b:0.5; a3_d4_fis4; fis4; fis4 b:0.5; fis4; fis4; a3_d4_e4 b:0.5; fis4 b:1.5;} 
  _Bm7(33)
  
  bar(34,b:0.25).notes  {_ b:0.5; fis5 b:0.5; fis5; fis5; fis5; e5 b:0.5; e5 b:2.25; }
  bar(34,b:0.25).notes  {_ b:0.5; ais3_cis4_fis4 b:0.5; fis4 b:0.33; e4 b:0.33; e4 b:0.33; e4 b:2;}
  _Fism(34)
  
  bar(35,b:0.25).notes {_ b:0.5; fis5 b:0.5;        fis5; e5; e5; e5; e5 b:0.5; fis5 b:0.5; _ b:1;} 
  bar(35,b:0.25).notes {_ b:0.5; a3_c4_fis4 b:0.5; fis4; e4; e4; e4; e4 b:0.5; fis4 b:1.5;} 
  _AM(35)
  
  bar(36,b:0.25).notes {_ b:0.5; fis5; fis5; fis5 b:0.33; e5 b:0.33; e5 b:0.33; e5 b:0.5; d5 b:0.5; _ b:1}   
  bar(36,b:0.25).notes {_ b:0.5; gis3_b3_fis4; fis4; fis4 b:0.33; e4 b:0.33; e4 b:0.33; e4 b:0.5; d4 b:1.5;}   
  _EM9(36)
  
  bar(37,b:0.25).notes {_ b:0.5; g5; g5; g5; fis5; e5; d5; d5 b:0.5; fis5 b:0.5; _ b:1;}   
  bar(37,b:0.25).notes {_ b:0.5; b3_d4_g4; g4; g4; fis4; e4; d4; b3_d4 b:0.5; fis4 b:1.5;}   
  _GM(37)
  
  bar(38,b:0.25).notes {_; d5; fis5; fis5; fis5 b:0.33; e5 b:0.33; d5 b:0.33; d5 b:1; _ b:1;}
  bar(38,b:0.25).notes {_; a3_d4; fis4; fis4; fis4 b:0.33; e4 b:0.33; d4 b:0.33; d4 b:2;}
  _DM(38)
  
  bar(39,b:0.25).notes {_; g4; e5; e5; e5; e5; d5; e5 b:0.5; d5; e5 b:1.25;}
  bar(39,b:0.25).notes {_; e3; e4; e4; g3_b3_e4; e4; e4; d4; e4 b:0.5; d4; fis4 b:1.25;}
  _Em7(39)
  
  bar(40,b:0.25).notes {_; fis4; fis5; fis5; fis5 b:0.5; a5 b:0.5; fis5 b:1; _ b:1;}
  bar(40,b:0.25).notes {_; fis3; ais3_cis4_fis4; fis4; fis4 b:0.5; e4; e4; ais3_cis4_fis4 b:2;}
  _FisM7(40)
  
  _Bm7(41)
  _Bm7_strum(41)
  
  _Fism(42)
  _Fism_strum(42)
  
  _AM(43)
  _AM_strum(43)
  
  _EM9(44)
  _EM9_strum(44)
  
  _GM(45)
  _GM_strum(45)
  
  _DM(46)
  _DM_strum(46)
  
  _Em7(47)
  _Em7_strum(47)
  
  _FisM7(48)
  _FisM7_strum(48)  
     
end