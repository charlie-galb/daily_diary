require 'model/entry'
describe Entry do
  it 'stores the name and title of diary entries in a database' do
    Entry.create('TESTING', '1,2,3,4')
    expect(Entry.all).to include(['TESTING', '1,2,3,4'])
  end
end
