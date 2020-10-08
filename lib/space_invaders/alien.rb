module SpaceInvaders
  class Alien < Bitmap

    def present?(area)
      @bitmap.each_with_index do |row, y|
        row.each_with_index do |bit, x|
          return false if bit & !area.bit_at(x, y)
        end
      end

      return true
    end
  end
end
