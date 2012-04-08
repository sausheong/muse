$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require "../lib/muse"
include Muse

Song.record 'test_file', bpm: 120, envelope: 'default', harmonic: 'guitar' do
  
  def test1(barnum)
    bar(barnum,b:0.5).notes { e4 b:1;}
  end
  
  bar(1,b:0.5).notes { c4}
  test1(2)
  bar(3,b:0.5).notes { g4 b: 1.5}
end
