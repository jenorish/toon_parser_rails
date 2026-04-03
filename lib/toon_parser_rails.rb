
require "toon_parser_rails/version"
require "toon_parser_rails/configuration"
require "toon_parser_rails/parser"
require "toon_parser_rails/tokenizer"
require "toon_parser_rails/response_builder"
require "toon_parser_rails/middleware"
require "toon_parser_rails/railtie" if defined?(Rails)

module ToonParserRails
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
