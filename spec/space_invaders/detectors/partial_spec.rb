require 'space_invaders'

describe SpaceInvaders::Detectors::Partial do
  subject(:detector) { described_class.new(80) }

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
      expect(detector.present?(alien, area)).to eq true
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
      expect(detector.present?(alien, area)).to eq true
    end
  end

  context 'when area is a partial 80% match' do
    let(:radar_sample_ascii) do
      <<~ASCII
        -----------
        -----------
        --ooooooo--
        -oo-ooo-oo-
        -ooooooooo-
        o-oo---oo-o
        o-o-----o-o
        ---oo-oo---
      ASCII
    end

    it 'detects the alien' do
      expect(detector.present?(alien, area)).to eq true
    end
  end

  context 'when area is a partial match below the thresold' do
    let(:radar_sample_ascii) do
      <<~ASCII
        -----------
        -----------
        --ooooooo--
        --o-ooo-o--
        --ooooooo--
        --oo---oo--
        --o-----o--
        ---oo-oo---
      ASCII
    end

    it 'doesnt detect the alien' do
      expect(detector.present?(alien, area)).to eq false
    end
  end
end
