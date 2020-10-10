require 'space_invaders'

describe SpaceInvaders::Alien do
  subject(:alien) { described_class.from_string("ooo\nooo\nooo") }
  let(:detector) { double('Detector') }
  let(:area) { double('Area') }

  describe '#present?' do
    it 'delegates to detector' do
      expect(detector).to receive(:present?).with(alien, area)
      alien.present?(area, detector)
    end

    context 'when detector is not provided' do
      it 'uses the default one' do
        expect_any_instance_of(SpaceInvaders::Detectors::Basic).to receive(:present?).with(alien, area)
        alien.present?(area)
      end
    end
  end
end
