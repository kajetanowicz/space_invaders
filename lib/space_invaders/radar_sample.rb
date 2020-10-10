module SpaceInvaders
  class RadarSample < Bitmap

    def each_area(area_width, area_height)
      raise StandardError, "Area is too wide - current width is #{width} vs. #{area_width}" if width < area_width
      raise StandardError, "Area is too high - current width is #{height} vs. #{area_height}" if height < area_height

      (0..(width - area_width)).each do |x|
        (0..(height - area_height)).each do |y|
          yield build_area(x, y, area_width, area_height)

        end
      end
    end

    private

    def build_area(x, y, area_width, area_height)
      Area.new(
        self,
        Point.new(x, y),
        Point.new(x + area_width - 1, y + area_height - 1)
      )
    end
  end
end
