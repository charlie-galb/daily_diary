require 'model/entry'
require 'database_helpers'
describe Entry do

  describe '#all' do
    it 'stores an array of bookmarks' do
      entry = Entry.create(title: 'TESTING', content: '1,2,3,4')
      Entry.create(title: 'Test2', content: 'This is the second test object.')
      Entry.create(title: 'Test3', content: 'This is the third test object.')

      entries = Entry.all

      expect(entries.length).to eq 3
      expect(entries.first).to be_a Entry
      expect(entries.first.id).to eq entry.id
      expect(entries.first.title).to eq 'TESTING'
      expect(entries.first.content).to eq '1,2,3,4'
    end
  end

  describe '#create' do
    it 'creates a new entry' do
      entry = Entry.create(title: 'TESTING', content: '1,2,3,4')
      persisted_data = persisted_data(id: entry.id)
      expect(entry).to be_a Entry
      expect(entry.id).to eq persisted_data['id']
      expect(entry.title).to eq 'TESTING'
      expect(entry.content).to eq '1,2,3,4'
    end
  end

end
