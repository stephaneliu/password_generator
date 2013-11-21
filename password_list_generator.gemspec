lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_list_generator/version'

Gem::Specification.new do |gem|
  gem.name          = 'password_list_generator'
  gem.version       = PasswordListGenerator::VERSION
  gem.authors       = ["Stephane Liu"]
  gem.email         = 'sliu@sjliu.com'
  gem.description   = 'Generate a list of passwords from command line with options for length and complexity into a file of your choice.'
  gem.summary       = 'Generate list of passwords easily from command line'
  gem.homepage      = 'https://github.com/stephaneliu/password_generator'
  # gem s.date      = '2013-10-24'
  gem.files         = `git ls-files`.split($/)
  puts "exe: #{gem.files.grep(%r{^bin/}).map {|f| File.basename(f)}}"
  gem.executables   = gem.files.grep(%r{^bin/}).map {|f| File.basename(f)}
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.cert_chain    = ['certs/stephaneliu.pem']
  gem.signing_key   = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  gem.add_development_dependency 'simplecov', '>= 0.7'
  gem.add_development_dependency 'coveralls', '>= 0.7.0'

  gem.license       = 'MIT'
end
