require 'rails_helper'

feature 'User can see resumed info in homepage' do 
  scenario 'And can view last 3 create tasks' do
    user = create(:user)
    first_task = create(:task, user: user)
    second_task = create(:task, user: user)
    third_task = create(:task, user: user)
    fourth_task = create(:task, user: user)
    login_as(user)

    visit root_path

    expect(page).to have_content('Your latest Tasks')
    expec(page).to have_content(first_task.title)
    expec(page).to have_content(second_task.title)
    expec(page).to have_content(third_task.title)
    expec(page).not_to have_content(fourth_task.title)
  end

  scenario 'And can view last 3 Completed tasks' do
    user = create(:user)
    first_task = create(:task, user: user)
    second_task = create(:task, user: user, status: 10)
    third_task = create(:task, user: user, status: 10)
    fourth_task = create(:task, user: user, status: 10)
    login_as(user)

    visit root_path

    expect(page).to have_content('Your last completed Tasks')
    expec(page).not_to have_content(first_task.title)
    expec(page).to have_content(second_task.title)
    expec(page).to have_content(third_task.title)
    expec(page).to have_content(fourth_task.title)

  end

  scenario 'And can view last 3 High Priority tasks' do
    user = create(:user)
    first_task = create(:task, user: user)
    second_task = create(:task, user: user, priority: 20)
    third_task = create(:task, user: user, priority: 20)
    fourth_task = create(:task, user: user, priority: 20)
    login_as(user)

    visit root_path

    expect(page).to have_content('Your highest priority Tasks')
    expec(page).not_to have_content(first_task.title)
    expec(page).to have_content(second_task.title)
    expec(page).to have_content(third_task.title)
    expec(page).to have_content(fourth_task.title)

  end
end
