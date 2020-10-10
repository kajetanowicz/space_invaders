require 'space_invaders'

describe SpaceInvaders::Bitmap do
  subject(:bitmap) { described_class.new([[false, true, false], [false, false, true]]) }

  describe '.from_file' do
    let(:sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }

    it 'builds bitmap based on a file content' do
      expect(described_class.from_file(sample_path)).to be_a(described_class)
    end
  end

  describe '.from_string' do
    let(:input) do
      <<~ASCII
        ---ooo---
        ---------
        ooooooooo
      ASCII
    end

    it 'builds bitmap from ascii input' do
      expect(described_class.from_string(input)).to be_a(described_class)
    end
  end

  describe '#bit_at' do
    it 'returns bit at given coordinate' do
      expect(bitmap.bit_at(1, 0)).to eq true
      expect(bitmap.bit_at(0, 0)).to eq false
      expect(bitmap.bit_at(2, 1)).to eq true
    end
  end

  describe '#width' do
    it 'returns the total width of the bitmap' do
      expect(bitmap.width).to eq 3
    end
  end

  describe '#height' do
    it 'returns the total height of the bitmap' do
      expect(bitmap.height).to eq 2
    end
  end
end
