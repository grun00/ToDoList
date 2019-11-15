require 'rails_helper'

feature 'User can see Status pages' do
  scenario 'and visits Complete Tasks Page' do
    user = create(:user)
    profile = create(:profile, user: user)
    complete_task = create(:task, user: user, status: 10)
    incomplete_task = create(:task, user: user)
    login_as(user)
    
    visit root_path
    click_on 'Complete Tasks'

    expect(page).to have_content(complete_task.title)
    expect(page).not_to have_content(incomplete_task.title) 
  end

  scenario 'and visits Incomplete Tasks Page' do
    user = create(:user)
    profile = create(:profile, user: user)
    complete_task = create(:task, user: user, status: 10)
    incomplete_task = create(:task, user: user)
    login_as(user)
    
    visit root_path
    click_on 'Incomplete Tasks'

    expect(page).not_to have_content(complete_task.title)
    expect(page).to have_content(incomplete_task.title) 
  end

end

