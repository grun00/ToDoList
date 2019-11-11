require 'rails_helper'

feature 'User can Create Task' do
  scenario 'Successfully' do
    user = create(:user)
    login_as(user)

    visit root_path
    click_on 'Create a Task'
    fill_in 'Task Name:', with: 'Test Task'
    fill_in 'Description:', with: 'Test Description'
    select 'Medium', from: 'Priority'
    click_on 'Create Task'

    expect(page).to have_content('Test Task')
    expect(page).to have_content('Test Description')
    expect(page).to have_content('Medium') 
  end

  scenario 'And must be loged in' do
    
  end

  scenario 'And Name must have more than 4 characters' do

  end

  scenario 'And Name must have less than 20 characters' do

  end 
end
