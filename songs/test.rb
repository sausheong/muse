require '../muse'

Song.record 'test_file' do
  bar(1,b:0.5).notes { a; b b:1;}

end