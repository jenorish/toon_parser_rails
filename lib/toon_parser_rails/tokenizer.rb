
module ToonParserRails
  class Tokenizer
    def self.tokenize(text)
      text.gsub("{", " { ")
          .gsub("}", " } ")
          .gsub(":", " : ")
          .split
    end
  end
end
