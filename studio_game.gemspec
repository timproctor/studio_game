Gem::Specification.new do |s|
  s.name         = "studio_game_timandcami"
  s.version      = "1.0.0"
  s.author       = "Tim Proctor"
  s.email        = "timandcamiproctor@gmail.com"
  s.homepage     = "https://www.linkedin.com/in/timproctor"
  s.summary      = "game from Ruby tutorial"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.txt'))
  #                 File.read(File.join(File.dirname(__FILE__), 'README'))

  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.txt README.txt)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 0'
end
