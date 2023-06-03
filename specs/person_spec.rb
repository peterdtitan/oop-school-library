require_relative '../person'
require_relative '../book'

RSpec.describe Person do
  let(:person) { Person.new(18) }
  let(:book) { Book.new('Title', 'Author') }
  let(:date) { '2023-08-18' }

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(25, 'John Doe')
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'reurns true' do
        person = Person.new(18)
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when person is under age but has parent\'s permision' do
      it 'returns true' do
        person = Person.new(15, 'Jane Doe', parent_permission: true)
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when person is under age and has not been permited' do
      it 'returns false' do
        person = Person.new(15, 'Grace Fieder', parent_permission: false)
        expect(person.can_use_services?).to be(false)
      end
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental object with the specified book and date' do
      rental = person.add_rental(book, date)
      expect(rental).to be_instance_of Rental
    end
  end

  describe '#to_h' do
    it 'returns a hash represantation of person' do
      person = Person.new(23, 'Alice Smith')
      expected_hash = {
        age: 23,
        name: 'Alice Smith',
        parent_permission: true,
        id: anything,
        rentals: []
      }
      expect(person.to_h).to match(expected_hash)
    end
  end
end
