require 'space_invaders'

describe SpaceInvaders::Alien do
  subject(:alien) { described_class.from_file(pattern_path) }
  let(:pattern_path) { "#{__dir__}../../../data/aliens/simple.txt" }

  describe '.from_file' do
    it 'builds alien from a file content' do
      expect(subject).to be_a(described_class)
    end
  end

  describe '#present?' do
    let(:radar) { SpaceInvaders::RadarSample.from_file(radar_sample_path) }
    let(:radar_sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }
    let(:area) do
      SpaceInvaders::Area.new(
        radar,
        SpaceInvaders::Point.new(6, 3),
        SpaceInvaders::Point.new(8, 6)
      )
    end

    it 'works' do
      expect(alien.present?(area)).to eq true
    end
  end
end
