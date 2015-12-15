source 'https://rubygems.org'

gem 'rails',            github: 'rails/rails'
gem 'sprockets-rails',  github: 'rails/sprockets-rails'
gem 'sprockets',        github: 'rails/sprockets'
gem 'sass-rails',       github: 'rails/sass-rails'
gem 'arel',             github: 'rails/arel'
gem 'rack',             github: 'rack/rack'
gem 'haml-rails'

gem 'uglifier',         '>= 1.3.0'
gem 'coffee-rails',     github: 'rails/coffee-rails'
gem 'therubyracer',     platforms: :ruby
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'

gem 'bootstrap-sass',   '~> 3.3.6'
gem 'bootswatch-rails'
gem 'kaminari'

gem 'puma'
gem 'httparty'
gem 'imgurapi',         github: 'mklocek/imgur'

gem 'pry-rails'
gem 'tzinfo-data',      platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'spring'
  gem 'listen',         '~> 3.0.5'
  gem 'annotate',       github: 'ctran/annotate_models', branch: 'develop'
end

# Include database gems for the adapters found in the database
# configuration file
require 'erb'
require 'yaml'
database_file = File.join(File.dirname(__FILE__), 'config/database.yml')
if File.exist?(database_file)
  database_config = YAML::load(ERB.new(IO.read(database_file)).result)
  adapters = database_config.values.map {|c| c['adapter']}.compact.uniq
  if adapters.any?
    adapters.each do |adapter|
      case adapter
        when 'mysql2'
          gem 'mysql2',                               platforms: [:mri, :mingw, :x64_mingw]
          gem 'activerecord-jdbcmysql-adapter',       platforms: :jruby
        when 'mysql'
          gem 'activerecord-jdbcmysql-adapter',       platforms: :jruby
        when 'postgresql'
          gem 'pg',                                   platforms: [:mri, :mingw, :x64_mingw]
          gem 'activerecord-jdbcpostgresql-adapter',  platforms: :jruby
        when 'sqlite3'
          gem 'sqlite3',                              platforms: [:mri, :mingw, :x64_mingw]
          gem 'jdbc-sqlite3',                         platforms: :jruby
          gem 'activerecord-jdbcsqlite3-adapter',     platforms: :jruby
        else
          warn("Unknown database adapter `#{ adapter }` found in config/database.yml")
      end
    end
  else
    warn('No adapter found in config/database.yml, please configure it first')
  end
else
  warn('Please configure your config/database.yml first')
end