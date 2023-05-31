require_relative 'app'

class Render
  def initialize
    @app = App.new
  end

  def list_options
    actions = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts actions
  end

  def get_request(message, input_type = :to_s)
    print message
    input = gets.chomp
    input_type == :to_i ? input.to_i : input
  end

  def execute_action(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    end
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals_for_person
    person_id = get_request('Enter person ID: ', :to_i)
    @app.list_rentals(person_id)
  end
end
