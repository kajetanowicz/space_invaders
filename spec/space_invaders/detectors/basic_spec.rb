require 'space_invaders'

describe SpaceInvaders::Detectors::Basic do
  let(:alien) do
    SpaceInvaders::Alien.from_string(<<~ASCII)
      --o-----o--
      ---o---o---
      --ooooooo--
      -oo-ooo-oo-
      ooooooooooo
      o-ooooooo-o
      o-o-----o-o
      ---oo-oo---
    ASCII
  end

  let(:area) do
    SpaceInvaders::Area.new(
      radar_sample,
      SpaceInvaders::Point.new(0, 0),
      SpaceInvaders::Point.new(10, 7)
    )
  end

  let(:radar_sample) do
    SpaceInvaders::RadarSample.from_string(radar_sample_ascii)
  end

  context 'when area is exact match' do
    let(:radar_sample_ascii) do
      <<~ASCII
        --o-----o--
        ---o---o---
        --ooooooo--
        -oo-ooo-oo-
        ooooooooooo
        o-ooooooo-o
        o-o-----o-o
        ---oo-oo---
      ASCII
    end

    it 'detects the alien' do
      expect(described_class.present?(alien, area)).to eq true
    end
  end

  context 'when area is covered with noise' do
    let(:radar_sample_ascii) do
      <<~ASCII
        ooooooooooo
        ooooooooooo
        ooooooooooo
        ooooooooooo
        ooooooooooo
        ooooooooooo
        ooooooooooo
        ooooooooooo
      ASCII
    end

    it 'detects the alien' do
      expect(described_class.present?(alien, area)).to eq true
    end
  end

  context 'when area doesnt exactly match' do
    let(:radar_sample_ascii) do
      <<~ASCII
        --ooooooo--
        -----o-----
        --ooooooo--
        -oo-ooo-oo-
        ooooooooooo
        o-ooooooo-o
        o-o-----o-o
        ---oo-oo---
      ASCII
    end

    it 'doesnt detect the alien' do
      expect(described_class.present?(alien, area)).to eq false
    end
  end

  context 'when area is a partial match' do
    let(:radar_sample_ascii) do
      <<~ASCII
       -----o-----
       ------o---o
       -----oooooo
       ----oo-ooo-
       ---oooooooo
       ---o-oooooo
       ---o-o-----
       ------oo-oo
      ASCII
    end

    it 'doesnt detect the alien' do
      expect(described_class.present?(alien, area)).to eq false
    end
  end
end
