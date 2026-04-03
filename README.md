# toon_rails

Add TOON format support to Ruby on Rails via middleware.

## Why?

TOON minimizes payload size by:
- defining schema once
- removing repetitive keys
- using row‑based data

Rails internally continues using JSON.

## Supported Content Types

- application/toon+plain
- application/json

## Input (TOON)

reviews {
  id, rating
}:
201, 5

## Output (JSON)

{
  "reviews": [{ "id": "201", "rating": "5" }]
}

## Configuration

ToonRails.configure do |config|
  config.enable_request_parsing = true
  config.enable_response_rendering = true
end
``
