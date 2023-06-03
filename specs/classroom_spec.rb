require_relative '../classroom'
require_relative '../student'

RSpec.describe 'Classroom' do
  describe '#initialize' do
    it 'should initialize label' do
      classroom = Classroom.new('Math')

      expect(classroom.label).to eq('Math')
    end

    it 'should set students to empty array' do
      classroom = Classroom.new('Math')

      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(23, 'Harry')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
