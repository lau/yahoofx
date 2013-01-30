Gem::Specification.new do |s|
  s.name        = 'yahoofx'
  s.version     = '0.1.2'
  s.executables << 'yahoofx'
  s.summary     = "Gets currency rates from Yahoo Finance"
  s.description = "The gem scrapes Yahoo Finance and returns foreign exchange rates. Also comes with a shell command."
  s.authors     = ["Lau Taarnskov"]
  s.email       = 'lau@taarnskov.com'
  s.files       = ["lib/yahoofx.rb", "lib/yahoofx/pair.rb"]
  s.licenses    = ["MIT"]
  s.homepage    = 'https://github.com/lau/yahoofx'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files test`.split("\n")

  s.add_development_dependency("webmock","~> 1.9.0")
end
