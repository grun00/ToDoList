require 'rails_helper'

feature 'User can search for tasks' do 
  scenario 'And find one specific name' do
    user = create(:user)
    first_task = create(:task, user: user)
    second_task = create(:task, user: user)
    login_as(user)

    visit root_path
    fill_in 'Search:', with: first_task.title
    click_on 'Search'

    expect(page).to have_content(first_task.title)
    expect(page).not_to have_content(second_task.title) 
  end

  scenario 'And find a partial name' do
    user = create(:user)
    first_task = create(:task, title: 'ABCTask1', user: user)
    second_task = create(:task, title: 'ABCTask2', user: user)
    third_task = create(:task, user: user)
    login_as(user)

    visit root_path
    fill_in 'Search:', with: 'ABC'
    click_on 'Search'

    expect(page).to have_content(first_task.title)
    expect(page).to have_content(second_task.title) 
    expect(page).not_to have_content(third_task.title) 
  end 

  scenario 'And can\'t find other users tasks' do
    user = create(:user)
    other_user = create(:user)
    task = create(:task, user: other_user)
    login_as(user)

    visit root_path
    fill_in 'Search:', with: task.title
    click_on 'Search'

    expect(page).to have_content('0 Results Found')
    expect(page).not_to have_content(task.title) 
  end
end
