require_relative '../book'

RSpec.describe Book do
  describe '#initialize' do
    it 'should set the title and author' do
      title = 'Some Title'
      author = 'Some Author'

      book = Book.new(title, author)
      expect(book.instance_variable_get(:@title)).to eq(title)
      expect(book.instance_variable_get(:@author)).to eq(author)
    end

    it 'should initialize empty rentals' do
      book = Book.new('Same Title', 'Same Author')
      expect(book.instance_variable_get(:@rentals)).to eq([])
    end
  end

  describe '#to_h' do
    it 'returns a hash represantation of the book' do
      book = Book.new('Doom', 'Belden Mugauri')
      expeted_result = {
        title: 'Doom',
        author: 'Belden Mugauri',
        rentals: []
      }
      expect(book.to_h).to match(expeted_result)
    end
  end
end
