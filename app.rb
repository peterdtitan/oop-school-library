require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'render'
require_relative 'data'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_data_from_file('books.json')
    @people = load_data_from_file('people.json')
    @rentals = load_data_from_file('rentals.json')
    ensure_files_exist
  end

  def list_books
    @books = load_data_from_file('books.json')
    if @books.empty?
      puts 'There are no books'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people'
    else
      puts 'List of people:'
      @people.each do |person|
        puts "ID: #{person['id']}, Name: #{person['name']}, Age: #{person['age']}"
      end
    end
  end

  def create_student
    input = Render.new
    age = input.get_request('Age: ', :to_i)
    name = input.get_request('Name: ')
    print 'Does the student have permission? [true/false]: '
    parent_permission = gets.chomp.downcase == 'true'
    classroom = input.get_request("Enter student's classroom (optional): ")
    class_name = Classroom.new(classroom)
    student = Student.new(age, name, parent_permission: parent_permission, classroom: class_name)
    @people << student
    save_data(@people, 'people.json')
  end

  def create_teacher
    input = Render.new
    age = input.get_request('Age: ', :to_i)
    name = input.get_request('Name: ')
    print 'Does the teacher have permission? [true/false]: '
    parent_permission = gets.chomp.downcase == 'true'
    specialization = input.get_request('Enter teacher\'s specialization: ')

    teacher = Teacher.new(age, name, parent_permission: parent_permission, specialization: specialization)
    @people << teacher
    save_data(@people, 'people.json')
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?  '
    type = gets.chomp.to_i

    case type
    when 1
      create_student
      puts 'Student has been added!'
    when 2
      create_teacher
      puts 'Teacher has been added!'
    else
      puts 'Invalid type, choose either student (1) or teacher (2).'
    end
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter author\'s name: '
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book
    save_data(@books, 'books.json')
    puts "Book #{new_book.title} has been created!"
  end

  def create_rental
    if @people.empty?
      puts 'Person not found'
    elsif @books.empty?
      puts 'Book not found'
    else
      display_book_list
      book_choice = get_request('Book number: ', :to_i)

      display_person_list
      person_choice = get_request('Person number: ', :to_i)

      date = get_request('Date [YYYY-MM-DD || YYYY/MM/DD]: ')

      rent_book(date, @books[book_choice], @people[person_choice - 1])
      save_data(@rentals, 'rentals.json')
      puts 'Created Rental!'
    end
  end

  def display_book_list
    puts 'Select a book below by number: '
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']} Author: #{book['author']}"
    end
  end

  def display_person_list
    puts 'Select a user by number: '
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']} Id: #{person['id']} Age: #{person['age']}"
    end
  end

  def get_request(prompt, conversion = :to_s)
    print prompt
    gets.chomp.send(conversion)
  end

  def rent_book(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def list_rentals(person_id)
    @rentals = load_data_from_file('rentals.json')
    rentals = @rentals.filter { |rental| rental['person']['id'] == person_id }

    rentals.each do |rental|
      puts "Rentals for #{rental['person']['name']}:"
      puts "Book '#{rental['book']['title']}' by #{rental['book']['author']}, Date: #{rental['date']},"
    end
  end

  private

  def generate_person_id
    @people.size + 1
  end
end
