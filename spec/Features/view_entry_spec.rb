feature 'titles visible on homepage' do
  scenario 'user can view entries' do
    Entry.create(title: 'Alright?', content: 'Yes, I am actually.')
    visit '/'
    expect(page).to have_content "Alright?"
  end
end
