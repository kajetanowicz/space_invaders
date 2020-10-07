require 'space_invaders'

describe SpaceInvaders::RadarSample do
  subject(:radar) { described_class.from_file(sample_path) }
  let(:sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }

  describe '.from_file' do
    it 'builds radar sample from a file content' do
      expect(subject).to be_a(described_class)
    end
  end

  describe '#bit_at' do
    let(:radar) do
      SpaceInvaders::RadarSample.new(
        [
          [false, true, false],
          [false, false, true],
        ]
      )
    end

    it 'returns the bit value at given coordinate' do
      expect(radar.bit_at(1, 0)).to eq true
      expect(radar.bit_at(0, 0)).to eq false
      expect(radar.bit_at(2, 1)).to eq true
    end
  end
end
