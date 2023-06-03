require_relative '../rental'

RSpec.describe '#Rental' do
  describe '#intialize' do
    it 'should set the date, book, and person' do
      date = '2023-05-31'
      book = { 'title' => 'Sample Book', 'rentals' => [] }
      person = { 'name' => 'Sample Person', 'rentals' => [] }

      rental = Rental.new(date, book, person)

      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
