describe SpaceInvaders::RadarSample do
  subject(:radar) { described_class.from_file(sample_path) }
  let(:sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }

  describe '.from_file' do
    it 'builds map from a file content' do
      expect(subject).to be_a(described_class)
    end
  end

  describe '#width' do
    it 'returns the horizontal size of the sample' do
      expect(subject.width).to eq 20
    end
  end

  describe '#height' do
    it 'returns the vertical size of the sample' do
      expect(subject.height).to eq 10
    end
  end
end
