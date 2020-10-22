require 'model/entry'
describe Entry do

  describe '#self.create' do
    it 'stores the name and title of diary entries in a database' do
      Entry.create('TESTING', '1,2,3,4')
      expect(Entry.all).to include(['TESTING', '1,2,3,4'])
    end
  end

  describe '#titles_to_links' do
    it 'converts titles in database to an html link' do
      Entry.create('TESTING', '1,2,3,4')
      Entry.create('Hey!', 'Is this working?')
      expect(Entry.titles_to_links).to eq(["<a href='/content?content=1,2,3,4'>'TESTING'</a>", "<a href='/content?content=Is this working?'>'Hey!'</a>"])
    end
  end

end
