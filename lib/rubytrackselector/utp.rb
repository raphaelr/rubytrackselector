#--
# Ruby Track Selector - A music selecting library for Rubygame.
# Copyright (C) 2010  Raphael Robatsch.
# 
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.
# 
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#++

# == Usage Example
# 
#     # Initialize
#     @rts = RTS::Rts.new
#     @rts.local << "data/music" # Add application specific music directory.    (optional)
#     @rts.enable_local = true   # Enable application specific music directory.
#     
#     # And play
#     @rts.tag = RTS::MENU       # See below for a full list of tags.
#                                # You can set it to any string you like.
#     @rts.play(:repeats => -1)  # Select a random music and play it.
#                                # Returns the selected Rubygame::Music.
#  
#      
#     # Or manually:
#     music = Rubygame::Music.load(@rts.files.sample)
#     music.play(:repeats => -1)
# 


module RTS
	# Tag for menu tracks.
	MENU = "menu"
	# Tag for calm menu tracks.
	CALM_MENU = "calm_menu"
	# Tag for loading tracks.
	LOADING = "loading"
	# Tag for calm loading tracks.
	CALM_LOADING = "calm_loading"
	# Tag for action tracks.
	ACTION_SCENE = "action_scene"
	# Tag for puzzle tracks.
	PUZZLE_SCENE = "puzzle_scene"
	# Tag for world map tracks.
	WORLD_SCENE = "world_scene"
	NONAME = nil # :nodoc:
	
	# Main RTS Class.
	class Rts < Struct.new(:local, :enable_local, :tag)
		# The current track being played by <tt>Rts#play</tt>.
		attr_reader :current
		
		# Initializes a new RTS.
		def initialize
			self.local = []
			self.enable_local = false
		end
		
		# Returns a list of all music files in the selected tag.
		def files
			a = [RTS.user_music]
			a += self.local if self.enable_local
			join_string = (self.tag ? "#{self.tag}/" : "") + "*.{ogg,wav,mid,midi,mod}"
			return a.collect { |x| Dir[File.join(x, join_string)] }.inject(:+)
		end
		
		# Selects a random music file and plays it. The option hash passed to
		# this method gets forwarded to <tt>Rubygame::Music#play</tt>. See
		# http://docs.rubygame.org/rdoc/current/classes/Rubygame/Music.html#M000407
		# for more information.
		def play(opts = {})
			if fn = files.sample
				@current = Rubygame::Music.load(files.sample)
				@current.play(opts)
				return @current
			else
				return nil
			end
		end
	end
end
