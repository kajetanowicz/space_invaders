module SpaceInvaders
  class Alien
    def self.from_file(filepath, parser = AsciiParser)
      new(parser.parse(File.read(File.expand_path(filepath))))
    end

    def initialize(bitmap)
      @bitmap = bitmap
    end

    def present?(area)
      @bitmap.each_with_index do |row, y|
        row.each_with_index do |bit, x|
          return false if bit & !area.bit_at(x, y)
        end
      end

      return true
    end

    def width
      @bitmap.first.size
    end

    def height
      @bitmap.size
    end
  end
end
