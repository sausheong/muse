require '../muse'

Song.record 'test_file' do
  bar(1,b:0.5).notes { c; e; g; c_e_g; _C}

end