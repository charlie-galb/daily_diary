feature 'content appears whenn title is clickec' do
  scenario 'user can read content of an entry by clicking on the title' do
    visit '/'
    fill_in('title', with: 'Bad day, got worse')
    fill_in('content', with: 'Late for work, I stubbed my toe heading out the door')
    click_on('Submit')
    click('Bad day, got worse')
    expect(page).to have_content('Late for work, I stubbed my toe heading out the door')
  end
end
