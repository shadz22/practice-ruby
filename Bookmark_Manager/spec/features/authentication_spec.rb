require 'spec_helper'

feature 'signing in' do
  scenario 'user can sign in' do
    User.create(email: 'testing@gmail.com', password: 'password123')
    visit '/'
    click_button 'Sign In'

    expect(current_path).to eq '/sessions/new'
  end
end