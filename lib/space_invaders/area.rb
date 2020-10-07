module SpaceInvaders
  Area = Struct.new(:radar, :top_left, :bottom_right) do
    def bit_at(x, y)
      radar.bit_at(top_left.x + x, top_left.y + y)
    end
  end
end
