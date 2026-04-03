
require "rails"

module ToonParserRails
  class Railtie < Rails::Railtie
    initializer "toon_parser_rails.middleware" do |app|
      app.middleware.use ToonParserRails::Middleware
    end
  end
end
