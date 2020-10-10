require 'space_invaders'

describe SpaceInvaders::Scanner do
  subject(:scanner) { described_class.new(radar_sample, aliens) }

  let(:aliens) do
    [
      SpaceInvaders::Alien.from_file("#{__dir__}../../../data/aliens/simple.txt"),
      SpaceInvaders::Alien.from_file("#{__dir__}../../../data/aliens/cross.txt"),
      SpaceInvaders::Alien.from_file("#{__dir__}../../../data/aliens/square.txt"),
    ]
  end

  let(:radar_sample) do
    SpaceInvaders::RadarSample.from_file("#{__dir__}../../../data/radar_samples/combined.txt")
  end

  describe '#detect' do
    it 'returns an array of Matches' do
      expect(scanner.detect).to be_a(Array)
      expect(scanner.detect.first).to be_a(SpaceInvaders::Match)
    end

    it 'returns matches for all aliens' do
      expect(scanner.detect.count).to eq 8
    end

    context 'marketer invaders' do
      let(:aliens) do
        [
          SpaceInvaders::Alien.from_file("#{__dir__}../../../data/aliens/invader_m1.txt"),
          SpaceInvaders::Alien.from_file("#{__dir__}../../../data/aliens/invader_m2.txt"),
        ]
      end

      let(:radar_sample) do
        SpaceInvaders::RadarSample.from_file("#{__dir__}../../../data/radar_samples/large.txt")
      end

      it 'returns matches for all aliens' do
        expect(scanner.detect.count).to eq 0
      end
    end
  end
end
