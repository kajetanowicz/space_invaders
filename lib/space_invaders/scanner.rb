module SpaceInvaders
  class Scanner
    def initialize(radar_sample, aliens)
      @radar_sample =  radar_sample
      @aliens = aliens
    end

    def detect
      @aliens.map { |alien| locate_positions(alien) }.flatten
    end

    private

    def locate_positions(alien)
      [].tap do |matches|
        @radar_sample.each_area(alien.width, alien.height) do |area|
          matches << Match.new(alien, area) if alien.present?(area)
        end
      end
    end
  end
end
