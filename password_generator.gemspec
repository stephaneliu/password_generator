Gem::Specification.new do |s|
  s.name        = 'password_generator'
  s.version     = '0.1'
  s.executables << 'pwgen'
  s.date        = '2013-10-24'
  s.summary     = 'Generate list of passwords easily from command line'
  s.description = 'Generate a list of passwords from command line with options for length and complexity'
  s.authors     = ["Stephane Liu"]
  s.email       = 'sliu@sjliu.com'
  s.files       = ['lib/password_generator', 'lib/password_generator/password.rb','lib/password_generator/generator.rb']
  s.homepage    = 'https://github.com/stephaneliu/password_generator'
  s.license     = 'MIT'
end
