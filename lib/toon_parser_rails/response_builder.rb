
require "json"

module ToonParserRails
  class ResponseBuilder
    def self.to_toon(json_body)
      data = JSON.parse(json_body)
      root = data.keys.first
      records = data[root]

      return "" unless records.is_a?(Array)

      fields = records.first.keys

      header = "#{root} [#{records.size}] {\n"
      header += fields.join(", ")
      header += "\n}:\n\n"

      rows = records.map do |record|
        fields.map { |f| record[f] }.join(", ")
      end

      header + rows.join("\n")
    end
  end
end
