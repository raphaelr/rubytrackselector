def usermusic_wrapper(new_md = ".rubytrackselector-test-tmp")
	dummy_stderr = Object.new
	def dummy_stderr.write(*); end
	original_stderr = $stderr
	
	$stderr = dummy_stderr
	original_md = RTS::RTS_DIR
	RTS::const_set(:RTS_DIR, new_md)
	$stderr = original_stderr
	
	yield
	
	$stderr = dummy_stderr
	RTS::const_set(:RTS_DIR, original_md)
	$stderr = original_stderr
end

def generate_musics(to = nil, n = 5)
	to ||= RTS.user_music
	n.times do
		s = ""
		20.times {  s += (rand('z'.ord - 'a'.ord) + 'a'.ord).chr }
		s += ".wav"
		
		FileUtils.cp("test/dummy.wav", File.join(to , s))
	end
	return Dir[File.join(to, "*.wav")]
end
