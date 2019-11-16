require 'rails_helper'

feature 'A profile has a share status' do
  scenario 'and when true makes profile public' do
    user = create(:user)
    other_user = create(:user)
    create(:profile, user: user)
    profile = create(:profile, user: other_user, share: true)
    login_as(user)

    visit profile_path(profile)

    expect(current_path).to eq profile_path(profile)

  end

  scenario 'and when false makes profile private' do
    user = create(:user)
    other_user = create(:user)
    create(:profile, user: user)
    profile = create(:profile, user: other_user)
    login_as(user)

    visit profile_path(profile.id)

    expect(current_path).to eq root_path

  end

end
