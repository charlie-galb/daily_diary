feature 'add new entry' do
  scenario 'user can add a new diary entry' do
    visit '/daily_diary'
    fill_in('title', with: 'Bad day, got worse')
    fill_in('content', with: 'Late for work, I stubbed my toe heading out the door')
    click_on('Submit')
    expect(page).to have_content('Bad day, got worse')
  end
end
