require_relative '../decorator'
require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('nameable', correct_name: 'john doe') }
  subject(:capitalize_decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name' do
      expect(capitalize_decorator.correct_name).to eq('John doe')
    end
  end
end
