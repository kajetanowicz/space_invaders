module SpaceInvaders
  module Detectors
    class Basic
      def present?(alien, area)
        (0...alien.width).each do |x|
          (0...alien.height).each do |y|
            return false if alien.bit_at(x, y) & !area.bit_at(x, y)
          end
        end

        return true
      end
    end
  end
end
