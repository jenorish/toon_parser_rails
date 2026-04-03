
require "spec_helper"
require "rack/test"

RSpec.describe ToonParserRails::Middleware do
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      use ToonParserRails::Middleware
      run ->(env) { [200, { "Content-Type" => "application/json" }, ['{"reviews":[{"id":1}]}']] }
    end
  end

  it "converts json to toon" do
    ToonParserRails.configure { |c| c.response_format = :toon }
    get "/"
    expect(last_response.headers["Content-Type"]).to eq("application/toon")
  end
end
