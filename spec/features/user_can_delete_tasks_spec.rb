require 'rails_helper'

feature 'User can Delete Tasks' do
  scenario 'Successfully' do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    visit root_path
    click_on 'Task Board'
    click_on task.title
    click_on 'Delete Task'
    click_on 'Confirm'

    expect(page).not_to have_content(task.title) 
  end

  scenario 'And Must be loged in' do
    user = create(:user)
    task = create(:task, user: user)

    visit task_path(task)

    expect(current_path).to eq new_user_session_path
  end 
end
