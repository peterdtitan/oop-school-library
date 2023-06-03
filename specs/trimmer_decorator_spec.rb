require_relative '../decorator'
require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable_short) { double('nameable', correct_name: 'John') }
  let(:nameable_long) { double('nameable', correct_name: 'ThisIsALongName') }

  describe '#correct_name' do
    it 'returns the same name if it is shorter than or equal to 10 characters' do
      trimmer_short = described_class.new(nameable_short)
      trimmer_long = described_class.new(nameable_long)

      expect(trimmer_short.correct_name).to eq('John')
      expect(trimmer_long.correct_name).to eq('ThisIsALon')
    end
  end
end
