
require "spec_helper"

RSpec.describe ToonParserRails::ResponseBuilder do
  it "converts json to toon" do
    json = { reviews: [{ id: 1, customer: "Ram" }] }.to_json
    toon = ToonParserRails::ResponseBuilder.to_toon(json)
    expect(toon).to include("reviews")
  end
end
