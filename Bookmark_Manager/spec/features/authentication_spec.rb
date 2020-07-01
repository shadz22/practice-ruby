require 'spec_helper'

feature 'signing in' do
  scenario 'user can sign in' do
    User.create(email: 'testing@gmail.com', password: 'password123')
    visit '/'
    click_button 'Sign In'

    expect(current_path).to eq '/sessions/new'

    fill_in :email, with: 'testing@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content 'Welcome, testing@gmail.com'
  end

  scenario 'user sees an error message if they use a wrong email' do
    User.create(email: 'testing@gmail.com', password: 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'wrongemail@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'

    expect(page).not_to have_content 'Welcome, testing@gmail.com'
    expect(page).to have_content 'Please enter a valid email or password'
  end

end