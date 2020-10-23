feature 'add new entry' do
  scenario 'user can add a new diary entry' do
    visit '/daily_diary'
    fill_in('title', with: 'Bad day, got worse')
    fill_in('content', with: 'Late for work, I stubbed my toe heading out the door')
    click_on('Submit')
    click_link('Bad day, got worse')
    click_on('Edit content')
    expect(page).to have_field('content', with: 'Late for work, I stubbed my toe heading out the door')
  end
end
