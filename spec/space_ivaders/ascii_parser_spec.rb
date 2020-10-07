describe SpaceInvaders::AsciiParser do
  describe '.parse' do
    let(:ascii) do
      <<~ASCII
        -----oooo-oo
        ------------
        --o---o-----
      ASCII
    end

    it 'turns ascii representation of an object into a bitmap' do
      expect(described_class.parse(ascii)).to eq(
        [
          [false, false, false, false, false, true, true, true, true, false, true, true],
          [false, false, false, false, false, false, false, false, false, false, false, false],
          [false, false, true, false, false, false, true, false, false, false, false, false],
        ]
      )
    end

    context 'when input contains invalid characters' do
      it 'raises an exception' do
        expect { described_class.parse('invalid input') }.to raise_error(StandardError, /Invalid character 'i'/)
      end
    end
  end
end
