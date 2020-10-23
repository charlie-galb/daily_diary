feature 'add new entry' do
  scenario 'user can add a new diary entry' do
    visit '/daily_diary'
    fill_in('title', with: 'Bad day, got worse')
    fill_in('content', with: 'Late for work, I stubbed my toe heading out the door')
    click_on('Submit')
    click_link('Bad day, got worse')
    click_on('Edit content')
    fill_in('post_content', with: "")
    fill_in('text', with: "Actually, it really wasn't so bad on reflection.")
    click_on('Submit')
    click_link('Bad day, got worse')
    expect(page).to have_content("Actually, it really wasn't so bad.")
  end
end
