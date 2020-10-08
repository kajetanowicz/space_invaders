require 'space_invaders'

describe SpaceInvaders::Alien do
  subject(:alien) { described_class.from_file(pattern_path) }
  let(:pattern_path) { "#{__dir__}../../../data/aliens/simple.txt" }
  let(:detector) { double('Detector') }
  let(:area) { double('Area') }

  describe '#present?' do
    it 'delegates to detector' do
      expect(detector).to receive(:present?).with(alien, area)
      alien.present?(area, detector)
    end

    context 'when detector is not provided' do
      it 'uses the default one' do
        expect(SpaceInvaders::Detectors::Basic).to receive(:present?).with(alien, area)
        alien.present?(area)
      end
    end
  end
end
