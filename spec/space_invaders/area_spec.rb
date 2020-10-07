require 'space_invaders'

describe SpaceInvaders::Area do
  subject(:area) { described_class.new(radar_sample, SpaceInvaders::Point.new(3, 2), SpaceInvaders::Point.new(6, 5)) }

  let(:radar_sample_path) { "#{__dir__}../../../data/radar_samples/squares.txt" }
  let(:radar_sample) { SpaceInvaders::RadarSample.from_file(radar_sample_path) }

  describe '#bit_at' do
    it 'returns value at that coordinate' do
      expect(area.bit_at(0, 0)).to be true
      expect(area.bit_at(1, 1)).to be false
      expect(area.bit_at(0, 2)).to be true
    end
  end
end
