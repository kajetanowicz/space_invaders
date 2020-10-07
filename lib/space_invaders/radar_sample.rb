module SpaceInvaders
  class RadarSample
    def self.from_file(filepath, parser = AsciiParser)
      new(parser.parse(File.read(File.expand_path(filepath))))
    end

    def initialize(bitmap)
      @bitmap = bitmap
    end

    def each_area(area_width, area_height)
      raise StadardError "Area is to wide - current width is #{width} vs. #{area_width}" if width < area_width
      raise StadardError "Area is to wide - current width is #{height} vs. #{area_height}" if height < area_height

      (0..(width - area_width)).each do |x|
        (0..(height - area_height)).each do |y|
          yield Area.new(
            self,
            Point.new(x, y),
            Point.new(x + area_width - 1, y + area_height - 1)
          )
        end
      end
    end

    def bit_at(x, y)
      @bitmap[y][x]
    end

    private

    def width
      @bitmap.first.size
    end

    def height
      @bitmap.size
    end
  end
end
