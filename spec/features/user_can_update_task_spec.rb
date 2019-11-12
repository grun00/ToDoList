require 'rails_helper'

feature 'User can edit Tasks' do
  scenario 'Successfully' do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    visit root_path
    click_on 'Task Board'
    click_on task.title
    click_on 'Edit Task'

    fill_in 'Task Title:', with: 'Test Task'
    fill_in 'Description:', with: 'Test Description'
    select 'High', from: 'Priority'
    click_on 'Update Task'

    expect(page).to have_content('Task Updated!')
    expect(page).to have_content('Test Task')
    expect(page).to have_content('Test Description')
    expect(page).to have_content('High') 
  end 
end
