module SpaceInvaders
  module AsciiParser
    def self.parse(ascii)
      ascii.split("\n").each_with_index.map do |line, row_number|
        line.chars.each_with_index.map { |char, column_number| parse_character(char, row_number, column_number) }
      end
    end

    def self.parse_character(char, row_number, column_number)
      case char
      when 'o' then true
      when 'O' then true
      when '-' then false
      else raise StandardError, "Invalid character '#{char}' in the input text at #{row_number + 1}:#{column_number + 1}"
      end
    end
  end
end
