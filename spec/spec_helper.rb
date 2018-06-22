if ENV['COVERAGE'] == 'true' && RUBY_ENGINE == 'ruby' && RUBY_VERSION == '2.4.1'
  require "simplecov"
  SimpleCov.start do
    add_filter '/spec/'
  end
end

require 'pry'

begin
  require 'byebug'
rescue LoadError; end

require 'pathname'

SPEC_ROOT = Pathname(__dir__)

Dir[SPEC_ROOT.join('shared/**/*.rb')].each(&method(:require))
Dir[SPEC_ROOT.join('support/**/*.rb')].each(&method(:require))

require "dry/schema"
require "dry/types"

module Types
  include Dry::Types.module
end

Undefined = Dry::Core::Constants::Undefined

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.after do
    if defined?(I18n)
      I18n.load_path = Dry::Schema.messages_paths.dup
      I18n.backend.reload!
    end
  end

  config.include PredicatesIntegration

  config.before do
    module Test
      def self.remove_constants
        constants.each { |const| remove_const(const)  }
        self
      end
    end
  end

  config.after do
    Object.send(:remove_const, Test.remove_constants.name)
  end
end
