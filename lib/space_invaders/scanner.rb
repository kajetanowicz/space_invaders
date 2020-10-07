module SpaceInvaders
  class Scanner
    def initialize(radar_sample, alien)
      @radar_sample =  radar_sample
      @alien = alien
    end

    def scan
      areas = []

      @radar_sample.each_area(@alien.width, @alien.height) do |area|
        areas << area if @alien.present?(area)
      end

      areas
    end
  end
end
