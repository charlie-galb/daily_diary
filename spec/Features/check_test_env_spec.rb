feature 'homepage loads correctly' do
  scenario 'It displays text' do
    visit '/'

    expect(page).to have_content "Alright?"
  end
end
