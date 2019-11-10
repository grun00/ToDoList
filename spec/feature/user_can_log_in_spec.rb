require 'rails_helper'

feature 'User can login' do
  scenario 'Sucessfully'do
    user = User.create!(email: 'user@email.com', password: '123456')

    visit root_path
    click_on 'Log In'
    within('form#new_user') do
      fill_in 'Email:', with: user.email
      fill_in 'Password:', with: '123456'
      click_on 'Log In!'
    end

    expect(page).to have_content('Signed in successfully.') 
  end
end
