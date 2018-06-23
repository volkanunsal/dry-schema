require 'dry/schema/types'
require 'dry/schema/macros'

module Dry
  module Schema
    class DSL < BasicObject
      Types = ::Dry::Schema::Types

      include ::Dry::Equalizer(:compiler, :options)

      attr_reader :compiler

      attr_reader :macros

      attr_reader :types

      attr_reader :options

      def initialize(compiler, options = {}, &block)
        @compiler = compiler
        @options = options
        @macros = []
        @types = {}
        instance_eval(&block) if block
      end

      def class
        ::Dry::Schema::DSL
      end

      def call
        macros.map { |m| [m.name, m.to_rule] }.to_h
      end

      def type_schema
        Types::Hash.schema(types)
      end

      def required(name, type = Types::Any, &block)
        key(name, type: type, macro: Macros::Required, &block)
      end

      def optional(name, type = Types::Any, &block)
        key(name, type: type, macro: Macros::Optional, &block)
      end

      def key(name, type:, macro:, &block)
        types[name] = case type
                      when Symbol
                        Dry::Types[type.to_s]
                      else
                        type.with(meta: { omittable: true })
                      end
        macro = macro.new(name: name, compiler: compiler)
        macro.value(&block) if block
        macros << macro
        macro
      end
    end
  end
end
