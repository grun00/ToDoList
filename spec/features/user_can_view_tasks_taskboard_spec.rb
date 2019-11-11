require 'rails_helper'

feature 'User can view tasks in TaskBoard' do
  scenario 'ordered by date'do
    user = create(:user)
    first_task = create(:task, user: user, title: 'first')
    second_task = create(:task, user: user, title: 'second')
    login_as(user)

    visit root_path
    click_on 'Task Board'

    expect(page).to have_css('h3', text: first_task.title)
    expect(page).to have_css('h3', text: second_task.title)
  end

  scenario 'and only sees their own tasks'do
    user = create(:user)
    other_user = create(:user, email: 'other@email.com')
    first_task = create(:task, user: user, title: 'first')
    second_task = create(:task, user: user, title: 'second')
    other_user_task = create(:task, user: other_user, title: 'other')
    login_as(user)

    visit root_path
    click_on 'Task Board'

    expect(page).to have_css('h3', text: first_task.title)
    expect(page).to have_css('h3', text: second_task.title)
    expect(page).not_to have_css('h3', text: other_user_task.title)
  end
end
