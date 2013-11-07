require 'simplecov'
# require 'coveralls'
SimpleCov.start

require File.join(File.dirname(__FILE__), "..", "lib", "password_list_generator")
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride' # fantabulous


# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
#     SimpleCov::Formatter::HTMLFormatter,
#       Coveralls::SimpleCov::Formatter
# ]

