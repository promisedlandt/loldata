require File.dirname(__FILE__) + '/lib/loldata/version'

Gem::Specification.new do |s|
  s.name = 'loldata'
  s.version = LolData::VERSION
  s.date = '2011-10-27'
  s.summary = 'League of Legends data scraper'
  s.description = 'Scrapes League of Legends champion and item data'
  s.authors = ['Nils Landt']
  s.email = ['loldata@promisedlandt.de']
  s.homepage = ''
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.version = LolData::VERSION
  s.add_dependency('nokogiri')
end
