require_relative "./dsl/config"
require_relative "./dsl/version"
require_relative "./dsl/rails_controller"
require_relative "./dsl/serializer"
require_relative "./dsl/components"
require_relative "./dsl/resolve_module"

module Swagger
  class DSL < Hash
    include ResolveModule

    class << self
      def current
        @current ||= new
      end
    end

    attr_reader :config

    def initialize(schema = nil, config: Config.new)
      merge!(schema || {})
      self["openapi"] ||= "3.0.0"
      self["info"] ||= {}
      self["paths"] ||= {}
      self["components"] = Components[self["components"] || {}]
      @config = config
    end
  end
end
