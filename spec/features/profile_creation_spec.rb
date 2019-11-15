require 'rails_helper'

feature 'User creates a profile' do
  scenario '(root)And is redirected to profile creating page if doesn\'t have one' do
    user = create(:user)
    login_as(user)
    
    visit root_path

    expect(current_path).to eq new_profile_path
  end

  scenario 'And can\'t access new_task_path if doesn\'t have a profile' do
    user = create(:user)
    login_as(user)
    
    visit new_task_path

    expect(current_path).to eq new_profile_path
  end

  scenario 'Successfully' do
    user = create(:user)
    login_as(user)

    visit root_path
    fill_in 'Nickname:', with: 'Godot'
    fill_in 'Bio', with: 'A Personal Bio'
    attach_file('Your Profile Picture', 'spec/support/assets/test-image.png')
    click_on 'Create Profile'

    expect(page).to have_content('Profile Created!')
    expect(page).to have_content('Godot')
    expect(page).to have_content('A Personal Bio')
    expect(Profile.last.avatar.attached?).to eq true
  end
end

