require 'space_invaders'

describe SpaceInvaders::Area do
  subject(:area) do
    described_class.new(
      radar_sample,
      SpaceInvaders::Point.new(1, 1),
      SpaceInvaders::Point.new(3, 3)
    )
  end

  let(:radar_sample) do
    SpaceInvaders::RadarSample.from_string(<<~ASCII)
    ----
    -o--
    -o-o
    -o--
    ASCII
  end

  describe '#bit_at' do
    it 'returns value at that coordinate' do
      expect(area.bit_at(0, 0)).to be true
      expect(area.bit_at(1, 1)).to be false
      expect(area.bit_at(2, 1)).to be true
      expect(area.bit_at(0, 2)).to be true
    end
  end
end
