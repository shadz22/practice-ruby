require 'spec_helper'

feature 'create a new bookmark' do
  scenario 'user can add a bookmark' do
    visit '/bookmarks/new'
    fill_in :url, with: 'http://www.twitter.com'
    fill_in :title, with: 'Twitter'
    click_button 'Submit'
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end

  scenario 'the url must be valid' do
    visit '/bookmarks/new'
    fill_in :url, with: 'not a valid link' 
    fill_in :title, with: 'Whatever'
    click_button 'Submit'

    expect(page).not_to have_content 'not a valid link' 
    expect(page).to have_content 'You must enter a valid URL'
  end
end
