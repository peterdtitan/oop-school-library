require_relative '../person'
require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher with the specified age and name' do
      teacher = Teacher.new(35, 'Jane Smith')

      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('Jane Smith')
    end

    it 'sets parent permission to true by default' do
      teacher = Teacher.new(35, 'Jane Smith')

      expect(teacher.parent_permission).to be(true)
    end

    it 'sets specialization to nil by default' do
      teacher = Teacher.new(35, 'Jane Smith')

      expect(teacher.specialization).to be_nil
    end
  end

  describe '#can_use_service?' do
    it 'returns true for teacher' do
      teacher = Teacher.new(35, 'Jane Smith')

      expect(teacher.can_use_service?).to be(true)
    end
  end
end
