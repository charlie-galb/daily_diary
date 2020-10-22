feature 'entries visible on homepage' do
  scenario 'user can view entries' do
    visit '/'
    expect(page).to have_content "Alright?"
    expect(page).to have_content "Yes, I am actually."
  end
end
