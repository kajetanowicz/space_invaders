require 'space_invaders'

describe SpaceInvaders::RadarSample do
  subject(:radar_sample) do
    described_class.from_string(<<~ASCII)
      ----------
      ----------
      ----------
      ----------
      ----------
      ----------
    ASCII
  end

  describe '#each_area' do
    it 'yields block with each area of specified size' do
      expect { |b| radar_sample.each_area(8, 5, &b) }.to yield_successive_args(
        kind_of(SpaceInvaders::Area), kind_of(SpaceInvaders::Area), kind_of(SpaceInvaders::Area),
        kind_of(SpaceInvaders::Area), kind_of(SpaceInvaders::Area), kind_of(SpaceInvaders::Area),
      )
    end

    context 'when specified area is to wide' do
      it 'raises an exception' do
        expect { |b| radar_sample.each_area(11, 1) }.to raise_error(StandardError, /too wide/)
      end
    end

    context 'when specified area is to high' do
      it 'raises an exception' do
        expect { |b| radar_sample.each_area(4, 10) }.to raise_error(StandardError, /too high/)
      end
    end
  end
end
