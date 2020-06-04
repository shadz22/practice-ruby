require 'spec_helper'

feature 'create a new bookmark' do
  scenario 'user can add a bookmark' do
    visit '/bookmarks/new'
    fill_in :url, with: 'http://www.twitter.com'
    fill_in :title, with: 'Twitter'
    click_button 'Submit'
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
