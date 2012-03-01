require "#{File.dirname(__FILE__)}/../lib/muse"

# "DONE x4" is the piece we play at the end of our daily standup :D

Song.record 'done_x4' do
  bar(1,b:0.5).notes { a4; a4; a4; f3 b:2.5; }
end
