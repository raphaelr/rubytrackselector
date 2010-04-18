require "test/unit"
require "fileutils"
require "rubytrackselector"
require "testhelper"

class HomedirTest < Test::Unit::TestCase
	def test_home
		assert_equal File.expand_path("~"), RTS.home
		assert_equal File.join(RTS.home, RTS::RTS_DIR), RTS.user_music
	end
	
	def test_no_music_dir
		usermusic_wrapper do
			FileUtils.rm_rf(RTS.user_music) rescue nil
			RTS.user_music(false)
			assert_equal false, Dir.exists?(RTS.user_music(false))
		end
	end
	
	def test_has_music_dir
		usermusic_wrapper do
			FileUtils.rm_rf(RTS.user_music) rescue nil
			RTS.user_music(true)
			assert_equal true, Dir.exists?(RTS.user_music(false))
		end
	end
end
