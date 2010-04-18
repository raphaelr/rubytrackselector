# This will print out 10 random song files. You can pass a tag
# as command line parameter. Default is "menu".
require File.join(File.dirname(__FILE__), "..", "lib", "rubytrackselector")

rts = RTS::Rts.new
rts.tag = ARGV[0] || RTS::MENU

10.times { puts rts.files.sample }
