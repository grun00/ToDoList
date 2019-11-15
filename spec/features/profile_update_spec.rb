require 'rails_helper'

feature 'User can Update profile' do
  scenario 'Bio' do 
    user = create(:user)
    create(:profile, user: user)
    login_as(user)

    visit root_path
    click_on 'My Profile'
    click_on 'Edit Info'

    fill_in 'Bio:', with: 'Another Bio'
    click_on 'Update Bio'

    expect(user.profile.bio).to eq 'Another Bio' 
  end
end
