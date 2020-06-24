require 'spec_helper'

feature 'registeration' do
  scenario 'user can sign up' do
    visit '/'
    click_button 'Sign Up'

    expect(current_path).to eq  '/users/new'

    fill_in :email, with: 'example123@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'

    expect(page).to have_content 'Welcome, example123@gmail.com'
    expect(current_path).to eq '/bookmarks'
  end
end