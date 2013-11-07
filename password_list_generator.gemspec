Gem::Specification.new do |s|
  s.name        = 'password_list_generator'
  s.version     = '0.4'
  s.executables << 'pwgen'
  s.date        = '2013-10-24'
  s.summary     = 'Generate list of passwords easily from command line'
  s.description = 'Generate a list of passwords from command line with options for length and complexity into a file of your choice.'
  s.authors     = ["Stephane Liu"]
  s.email       = 'sliu@sjliu.com'
  s.files       = ['lib/password_list_generator', 'lib/password_list_generator.rb', 'lib/password_list_generator/password.rb','lib/password_list_generator/generator.rb']
  s.add_development_dependency "simplecov", ">= 0.7"
  s.add_development_dependency 'coveralls', '>= 0.7.0'
  s.homepage    = 'https://github.com/stephaneliu/password_generator'
  s.license     = 'MIT'
end
