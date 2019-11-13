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

    fill_in 'Task Title', with: 'Test Task'
    fill_in 'Description', with: 'Test Description'
    select 'High', from: 'Priority'
    click_on 'Update Task'

    expect(page).to have_content('Task Updated!')
    expect(page).to have_content('Test Task')
    expect(page).to have_content('Test Description')
    expect(page).to have_content('High') 
  end 

  scenario 'and can change status to complete' do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

  end

  scenario 'And change status to complete' do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    visit root_path
    click_on 'Task Board'
    click_on task.title
    select 'Complete', from: 'Status'
    click_on 'Change Status'

    expect(page).to have_css('p', text: 'Complete')
  end

  scenario 'And must fill all fields' do
    user = create(:user)
    task = create(:task, user: user)
    login_as(user)

    visit root_path
    click_on 'Task Board'
    click_on task.title
    click_on 'Edit Task'
    fill_in 'Task Title', with: ''
    fill_in 'Description', with: ''
    click_on 'Update Task'

    expect(current_path).to eq "/tasks/#{task.id}" 

  end
end
