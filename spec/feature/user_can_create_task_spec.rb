require 'rails_helper'

feature 'User can Create Task' do
  scenario 'Successfully' do
    user = create(:user)
    login_as(user)


  end

  scenario 'And Name must have more than 4 characters' do

  end

  scenario 'And Name must have less than 20 characters' do

  end 
end
