
require "rack"
require "stringio"
require "json"

module ToonParserRails
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)

      if env["CONTENT_TYPE"] == "application/toon"
        request = Rack::Request.new(env)
        body = request.body.read
        parsed = Parser.parse(body)

        env["CONTENT_TYPE"] = "application/json"
        env["rack.input"] = StringIO.new(parsed.to_json)
      end

      status, headers, response = @app.call(env)

      if ToonParserRails.configuration&.response_format == :toon
        response_body = ""
        response.each { |part| response_body += part }

        toon_body = ResponseBuilder.to_toon(response_body)

        headers["Content-Type"] = "application/toon"
        headers["Content-Length"] = toon_body.bytesize.to_s
        response = [toon_body]
      end

      [status, headers, response]
    end
  end
end
