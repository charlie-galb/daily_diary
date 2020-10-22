require 'model/entry'
describe Entry do

  describe '#self.create' do
    it 'stores the name and title of diary entries in a database' do
      Entry.create('TESTING', '1,2,3,4')
      expect(Entry.all).to include(['TESTING', '1,2,3,4'])
    end
  end

  describe '#link' do
    it 'converts titles in database to an html link' do
      Entry.create('TESTING', '1,2,3,4')
      Entry.create('Hey!', 'Is this working?')
      expect(Entry.link).to eq([ "<a href='/content'>'TESTING'</a>", "<a href='/content'>'Hey!'</a>"])
    end
  end

end
