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
end