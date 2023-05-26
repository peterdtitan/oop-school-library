require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    self.classroom = classroom
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students << self if classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
