
module ToonParserRails
  class Configuration
    attr_accessor :response_format

    def initialize
      @response_format = :json
    end
  end
end
