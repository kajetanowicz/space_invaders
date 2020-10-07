describe SpaceInvaders::Alien do
  subject(:alien) { described_class.from_file(pattern_path) }
  let(:pattern_path) { "#{__dir__}../../../data/aliens/simple.txt" }

  describe '.from_file' do
    it 'builds alien from a file content' do
      expect(subject).to be_a(described_class)
    end
  end
end
