module SpaceInvaders
  module AsciiParser
    def self.parse(ascii)
      ascii.split("\n").map do |line|
        line.chars.map { |char| parse_character(char) }
      end
    end

    def self.parse_character(char)
      case char
      when 'o' then true
      when '-' then false
      else raise StandardError, "Invalid character '#{char}' in the input text."
      end
    end
  end
end
