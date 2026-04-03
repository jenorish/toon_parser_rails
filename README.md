
# ToonParserRails

TOON Parser Rails gem converts TOON → JSON (request) and JSON → TOON (response).

## Installation

Add to Gemfile

gem 'toon_parser_rails'

## Configuration

ToonParserRails.configure do |config|
  config.response_format = :toon
end

## Flow

TOON Request → Rails Controller → JSON Response → TOON Response

## Content-Type

application/toon

## Example

reviews [2] {
id, customer
}:

201, Ram
202, Sita
