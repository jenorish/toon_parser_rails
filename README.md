# Toon Parser Rails

A Rack middleware gem for Ruby on Rails that adds seamless TOON format support to your API, enabling efficient data serialization with minimal payload sizes.

## What is This Gem?

**Toon Parser Rails** is a middleware solution that integrates the TOON format into your Rails application. TOON is a schema-based, row-oriented data format that dramatically reduces payload sizes compared to traditional JSON, while maintaining full transparency with your Rails application.

The gem automatically:
- Parses incoming TOON format requests and converts them to JSON for Rails processing
- Converts JSON responses back to TOON format when requested
- Manages all format negotiation and content-type handling

---

## 🎯 Use Cases

- **Mobile Applications**: Reduce bandwidth consumption for users on slow or metered connections
- **IoT Devices**: Minimize data transfer for resource-constrained devices
- **High-Traffic APIs**: Decrease server load and improve response times
- **Legacy System Integration**: Bridge communication between modern and older systems
- **Edge Computing**: Optimize data transmission to edge servers

---

## ✨ Advantages

| Advantage | Benefit |
|-----------|---------|
| **Minimal Payload Size** | TOON format reduces payload by 60-80% compared to JSON through schema-based design |
| **Transparent Integration** | Rails applications work internally with JSON; TOON conversion happens in middleware |
| **Zero Configuration Required** | Works out of the box with sensible defaults |
| **Performance Optimized** | Fast parsing and serialization with minimal overhead |
| **Easy Enable/Disable** | Toggle TOON format responses on a per-request basis |
| **Type Safe** | Schema-based parsing ensures data integrity |
| **Rack Compatible** | Works with any Rack-based application, not just Rails |

---

## 📥 How to Install

### Step 1: Add to Gemfile
```ruby
gem 'toon_parser_rails'
```

### Step 2: Install Dependencies
```bash
bundle install
```

That's it! The gem automatically integrates with Rails via the Railtie.

---

## ⚙️ How to Configure

### Basic Configuration
Create an initializer file `config/initializers/toon_parser_rails.rb`:

```ruby
ToonParserRails.configure do |config|
  # Set default response format
  # Options: :json (default) or :toon
  config.response_format = :json
end
```

### Using TOON Format Responses
To request responses in TOON format, set the `response_format` configuration:

```ruby
ToonParserRails.configure do |config|
  config.response_format = :toon
end
```

### Supported Content Types
The middleware supports the following content types:
- `application/toon` - TOON format
- `application/json` - JSON format (default)

---

## 📝 Usage Examples

### TOON Format Request

**Input (TOON)**:
```
reviews {
  id, rating
}:
201, 5
202, 4
```

**Automatically Converted to JSON**:
```json
{
  "reviews": [
    { "id": "201", "rating": "5" },
    { "id": "202", "rating": "4" }
  ]
}
```

### Request with TOON Content-Type
```bash
curl -X POST https://api.example.com/reviews \
  -H "Content-Type: application/toon" \
  -d 'reviews { id, rating }: 201, 5'
```

The middleware automatically converts this to JSON for your Rails controller.

---

## 🔧 How It Works

1. **Request Phase**: 
   - Middleware checks incoming `Content-Type` header
   - If `application/toon`, parses TOON data and converts to JSON
   - Sets `Content-Type` to `application/json` for Rails processing

2. **Processing Phase**:
   - Rails processes the request normally using JSON
   - Your controllers remain unchanged

3. **Response Phase**:
   - If `response_format` is `:toon`, converts JSON response back to TOON
   - Sets `Content-Type` to `application/toon`
   - Returns optimized TOON format to client

---

## 🏗️ Architecture

The gem consists of the following components:

- **Middleware**: Core Rack middleware handling format conversion
- **Parser**: Converts TOON format to Ruby data structures
- **Tokenizer**: Breaks down TOON input into tokens
- **ResponseBuilder**: Converts JSON responses back to TOON format
- **Configuration**: Manages gem settings and behavior
- **Railtie**: Automatically integrates middleware into Rails

---

## 📋 Requirements

- Ruby 2.5 or higher
- Rails 4.2 or higher
- Rack (included with Rails)

---

## 🧪 Development

### Running Tests
```bash
bundle exec rspec
```

### Development Dependencies
- rspec
- rack-test

---

## 📄 License

This gem is available under the **MIT License**. See the [LICENSE](LICENSE) file for full details.

MIT License - You are free to use, modify, and distribute this gem in your projects.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues.

---

## 📚 Additional Resources

- [TOON Format Specification](#) (coming soon)
- [Rails Middleware Guide](https://guides.rubyonrails.org/rails_on_rack.html)
- [Rack Documentation](https://rack.github.io/)
