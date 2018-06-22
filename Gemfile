source 'https://rubygems.org'

gemspec

gem 'dry-logic', git: 'https://github.com/dry-rb/dry-logic.git', branch: 'improvements-for-dry-schema'

group :test do
  gem 'i18n', require: false
  platform :mri do
    gem 'codeclimate-test-reporter', require: false
    gem 'simplecov', require: false
  end
  gem 'dry-monads', require: false
  gem 'dry-struct', require: false
end

group :development, :test do
  gem 'pry'
end

group :tools do
  gem 'byebug', platform: :mri
end

group :benchmarks do
  gem 'hotch', platform: :mri
  gem 'activemodel', '~> 5.0'
  gem 'actionpack', '~> 5.0'
  gem 'benchmark-ips'
  gem 'virtus'
end
