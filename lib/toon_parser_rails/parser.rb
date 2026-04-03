
require "json"

module ToonParserRails
  class Parser
    def self.parse(toon_text)
      lines = toon_text.strip.split("\n")
      header = lines[0]
      root = header.split(" ")[0]

      fields = header.match(/\{(.+)\}/)[1]
                    .split(",")
                    .map(&:strip)

      data_lines = lines[2..-1] || []

      records = data_lines.map do |line|
        values = line.split(",").map(&:strip)
        Hash[fields.zip(values)]
      end

      { root => records }
    end
  end
end
