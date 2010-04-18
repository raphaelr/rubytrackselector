require "rake/testtask"
require "rake/rdoctask"
require "rake/gempackagetask"
require "lib/rubytrackselector.rb"

spec = Gem::Specification.new do |s|
	s.name = "rubytrackselector"
	s.summary = "A music selection library for Rubygame."
	s.version = RTS::VERSION.join(".")
	
	s.required_ruby_version = ">= 1.8"
	s.add_dependency("rubygame", "~> 2.6")
	
	s.author = "Raphael Robatsch"
	s.email = "mf.m-f@rleahpar".reverse
	s.has_rdoc = true
	s.homepage = "http://raphaelr.github.com/rubytrackselector"
	
	s.files  = Dir["lib/**/*"] + Dir["test/**/*"] + Dir["doc/**/*"]
	s.files += Dir["samples/*"] + Dir["*"]
	s.extra_rdoc_files = Dir["doc/*.rdoc"]
	s.test_files = Dir["test/test_*.rb"]
end

Rake::TestTask.new do |t|
	t.libs << "test"
	t.pattern = "test/test_*.rb"
end

Rake::RDocTask.new do |t|
	t.main = "doc/index.rdoc"
	t.title = "Ruby Track Selector #{RTS::VERSION.join(".")}"
	t.rdoc_files = Dir["doc/*.rdoc"] + Dir["lib/**/*"]
end

Rake::GemPackageTask.new(spec) do |t|
	t.need_tar_gz
end
