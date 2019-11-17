require 'rails_helper'

feature 'User can make comments' do
  scenario 'Successfully' do
    user = create(:user)
    create(:profile, user: user)
    task = create(:task, user: user)
    login_as(user)

    visit task_path(task)
    fill_in 'Comment', with: 'Test Comment'
    click_on 'Make Comment'

    expect(page).to have_content('Comment Added!')
    expect(page).to have_content('Test Comment')

  end

  scenario 'And can make multiple comments on same Task' do
    user = create(:user)
    create(:profile, user: user)
    task = create(:task, user: user)
    login_as(user)

    visit task_path(task)
    fill_in 'Comment', with: 'First Comment'
    click_on 'Make Comment'
    fill_in 'Comment', with: 'Second Comment'
    click_on 'Make Comment'

    expect(page).to have_content('First Comment')
    expect(page).to have_content('Second Comment')

  end

  scenario 'And comment can\'t be blank' do 
    user = create(:user)
    create(:profile, user: user)
    task = create(:task, user: user)
    login_as(user)

    visit task_path(task)
    fill_in 'Comment', with: ''
    click_on 'Make Comment'

    expect(page).to have_content('Comment body can\'t be blank')
    expect(page).not_to have_content('Test Comment')

  end

  scenario 'And can go to the user profile if public' do
    user = create(:user)
    create(:profile, user: user, share: true)
    task = create(:task, user: user)
    comment = create(:comment, user: user, task: task)
    login_as(user)

    visit task_path(task)
    click_on user.nickname

    expect(current_path).to eq profile_path(user) 

  end

  scenario 'And get a \'Private Profile\' page if profile private' do
    user = create(:user)
    create(:profile, user: user, share: true)
    task = create(:task, user: user)
    comment = create(:comment, user: user, task: task)
    login_as(user)

    visit task_path(task)
    click_on user.nickname

    expect(current_path).not_to eq profile_path(user)
    expect(page).to have_content('Profile Private')

  end

  scenario 'And can Delete a Comment' do
    user = create(:user)
    create(:profile, user: user, share: true)
    task = create(:task, user: user)
    comment = create(:comment, user: user, task: task)
    login_as(user)

    visit task_path(task)
    click_on 'Delete Comment'
    click_on 'Yes'

    expect(Comment.last).not_to eq comment

  end

  scenario 'And can Like a comment' do

  end

  scenario 'And can Dislike a comment' do

  end

  scenario 'And can sort Comments By New' do

  end

  scenario 'And can sort Comments by Old' do

  end

  scenario 'And can sort by most Likes' do

  end

  scenario 'And can sort by most Dislikes' do

  end

  scenario 'And can see all own comments' do

  end
end
