
require "spec_helper"

RSpec.describe ToonParserRails::Parser do
  it "parses toon format" do
    input = "reviews [1] { id, customer }:\n\n201, Ram"
    result = ToonParserRails::Parser.parse(input)
    expect(result["reviews"][0]["id"]).to eq("201")
  end
end
