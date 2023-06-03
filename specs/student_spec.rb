require_relative '../person'
require_relative '../classroom'
require_relative '../student'

RSpec.describe Student do
  describe '#initialize' do
    it 'creates a new student with the specified age and name' do
      student = Student.new(15, 'John Doe')

      expect(student.age).to eq(15)
      expect(student.name).to eq('John Doe')
    end

    it 'sets parent permission to true by default' do
      student = Student.new(15, 'John Doe')

      expect(student.parent_permission).to be(true)
    end

    it 'sets classroom to nil by default' do
      student = Student.new(15, 'John Doe')

      expect(student.classroom).to be_nil
    end
  end

  describe '#classroom=' do
    it 'assigns the student to the specified classroom' do
      classroom = Classroom.new('Math Class')
      student = Student.new(15, 'John Doe')

      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it 'removes the student from the previous classroom' do
      math_classroom = Classroom.new('Math Class')
      physics_classroom = Classroom.new('Physics Class')
      student = Student.new(15, 'John Doe', classroom: math_classroom)

      student.classroom = physics_classroom

      expect(student.classroom).to eq(physics_classroom)
      expect(math_classroom.students).not_to include(student)
      expect(physics_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      student = Student.new(15, 'John Doe')

      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
