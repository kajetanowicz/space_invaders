module SpaceInvaders
  class Bitmap
    def self.from_file(filepath)
      from_string(File.read(File.expand_path(filepath)))
    end

    def self.from_string(input, parser = AsciiParser)
      new(parser.parse(input))
    end

    def initialize(bitmap)
      @bitmap = bitmap
    end

    def bit_at(x, y)
      @bitmap[y][x]
    end

    def width
      @bitmap.first.size
    end

    def height
      @bitmap.size
    end
  end
end
