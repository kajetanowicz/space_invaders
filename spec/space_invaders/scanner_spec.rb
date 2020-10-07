describe SpaceInvaders::Scanner do
  subject(:scanner) { described_class.new(radar, alien) }

  let(:alien) { SpaceInvaders::Alien.from_file(alien_path) }

  let(:radar) { SpaceInvaders::RadarSample.from_file(radar_sample_path) }
  let(:radar_sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }

  def area_for(top_left_x, top_left_y, bottom_right_x, bottom_right_y)
    SpaceInvaders::Area.new(
      radar,
      SpaceInvaders::Point.new(top_left_x, top_left_y),
      SpaceInvaders::Point.new(bottom_right_x, bottom_right_y)
    )
  end

  describe '#scan' do
    subject { scanner.scan }

    context 'simple example' do
      let(:alien_path) { "#{__dir__}../../../data/aliens/simple.txt" }
      let(:radar_sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }
      it { is_expected.to eq [area_for(6, 3, 8, 5)] }
    end

    context 'alien like a cross' do
      let(:alien_path) { "#{__dir__}../../../data/aliens/cross.txt" }
      let(:radar_sample_path) { "#{__dir__}../../../data/radar_samples/simple.txt" }
      it { is_expected.to eq [area_for(6, 3, 8, 5)] }
    end

    context 'square aliens' do
      let(:alien_path) { "#{__dir__}../../../data/aliens/square.txt" }
      let(:radar_sample_path) { "#{__dir__}../../../data/radar_samples/squares.txt" }
      it { is_expected.to eq [area_for(3, 2, 9, 8), area_for(29, 12, 35, 18)] }
    end
  end
end
