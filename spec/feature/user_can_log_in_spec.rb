require 'rails_helper'

feature 'User can login' do
  scenario 'Sucessfully'do
    user = create(:user)

    visit root_path
    click_on 'Log In'
    within('form#new_user') do
      fill_in 'Email:', with: user.email
      fill_in 'Password:', with: '123456'
      click_on 'Log In!'
    end

    expect(page).to have_content('Signed in successfully.') 
  end

  scenario 'and can create an Account' do
    visit root_path
    click_on 'Log In'
    click_on 'Sign up'
    fill_in 'Email:', with: 'user@email.com'
    fill_in 'Password:', with: '123456'
    fill_in 'Password Confirmation:', with: '123456'
    click_on 'Sign up!'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq root_path
  end

  scenario 'and can log out' do
    user = create(:user) 

    visit root_path
    click_on 'Log In'
    within('form#new_user') do
      fill_in 'Email:', with: user.email
      fill_in 'Password:', with: '123456'
      click_on 'Log In!'
    end
    click_on 'Log Out'

    expect(current_path).to eq root_path
    expect(page).to have_content('Signed out successfully') 
    expect(page).to have_content('Log In')
  end

end
