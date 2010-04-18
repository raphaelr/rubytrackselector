require "test/unit"
require "fileutils"
require "rubytrackselector"
require "testhelper"

class UsermusicTest < Test::Unit::TestCase
	def setup
		usermusic_wrapper do
			FileUtils.rm_rf(RTS.user_music(false)) rescue nil
			@musics = generate_musics.sort
			@rts = RTS::Rts.new
		end
	end
	
	def test_user_musics
		usermusic_wrapper do
			assert_equal @musics, @rts.files.sort
		end
	end
	
	def test_local_musics
		usermusic_wrapper do
			@rts.local << ["test"]
			@rts.enable_local = true
			assert_equal [*@musics, "test/dummy.wav"].sort, @rts.files
		end
	end
	
	def test_disable_local_musics
		usermusic_wrapper do
			@rts.local << ["test"]
			@rts.enable_local = false
			assert_equal @musics, @rts.files.sort
		end
	end
	
	def test_default_disable_local_musics
		usermusic_wrapper do
			@rts.local << ["test"]
			assert_equal @musics, @rts.files.sort
		end
	end
end
