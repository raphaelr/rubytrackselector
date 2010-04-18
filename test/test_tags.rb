require "test/unit"
require "fileutils"
require "rubytrackselector"
require "testhelper"

class TagTest < Test::Unit::TestCase
	def setup
		usermusic_wrapper do
			FileUtils.rm_rf(RTS.user_music(false)) rescue nil
			Dir.mkdir(File.join(RTS.user_music, "tag1"))
			Dir.mkdir(File.join(RTS.user_music, "tag2"))
			
			@musics    = []
			@musics[0] = generate_musics(RTS.user_music + "/tag1").sort
			@musics[1] = generate_musics(RTS.user_music + "/tag2").sort
			@musics[2] = generate_musics.sort
			@rts = RTS::Rts.new
		end
	end
	
	def test_tags
		usermusic_wrapper do
			assert_equal @musics[2], @rts.files
			
			@rts.tag = "tag1"
			assert_equal @musics[0], @rts.files
			
			@rts.tag = "tag2"
			assert_equal @musics[1], @rts.files
			
			@rts.tag = nil
			assert_equal @musics[2], @rts.files
		end
	end
end
