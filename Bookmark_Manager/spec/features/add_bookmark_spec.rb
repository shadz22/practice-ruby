require 'spec_helper'

feature 'create a new bookmark' do
  scenario 'user can add a bookmark' do
    visit '/bookmarks/new'
    fill_in :url, with: 'http://www.twitter.com'
    click_button 'Submit'
    expect(page).to have_content 'http://www.twitter.com'
  end
end
