require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
	SimpleCov::Formatter::HTMLFormatter,
	Coveralls::SimpleCov::Formatter
]
#SimpleCov.command_name 'guard'
SimpleCov.start

require File.join(File.dirname(__FILE__), "..", "lib", "password_list_generator")
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride' # fantabulous
