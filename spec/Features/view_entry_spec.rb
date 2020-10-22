feature 'entries visible on homepage' do
  scenario 'user can view entries' do
    Entry.create('Alright?', 'Yes, I am actually.')
    visit '/'
    expect(page).to have_content "Alright?"
    expect(page).to have_content "Yes, I am actually."
  end
end
