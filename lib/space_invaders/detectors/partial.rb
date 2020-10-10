module SpaceInvaders
  module Detectors
    class Partial
      def initialize(threshold = 100)
        @threshold = threshold
      end

      def present?(alien, area)
        hits = 0
        alien_size = 0

        (0...alien.width).each do |x|
          (0...alien.height).each do |y|
            alien_size += 1 if alien.bit_at(x, y)
            hits +=1 if alien.bit_at(x, y) & area.bit_at(x, y)
          end
        end

        return calculate_coverage(hits, alien_size) >= @threshold
      end

      private

      def calculate_coverage(hits, alien_size)
        ((hits.to_f / alien_size.to_f) * 100).round
      end
    end
  end
end
