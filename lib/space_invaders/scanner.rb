module SpaceInvaders
  class Scanner
    def initialize(radar_sample, aliens)
      @radar_sample =  radar_sample
      @aliens = aliens
    end

    def detect(detector = Detectors::Basic.new)
      @aliens.map { |alien| locate_positions(alien, detector) }.flatten
    end

    private

    def locate_positions(alien, detector)
      [].tap do |matches|
        @radar_sample.each_area(alien.width, alien.height) do |area|
          matches << Match.new(alien, area) if alien.present?(area, detector)
        end
      end
    end
  end
end
