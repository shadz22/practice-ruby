require 'spec_helper'
require 'pg'

feature 'update bookmark' do
  scenario 'A user can edit a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testingupdates.com', title: 'Testing Updates')
    visit '/bookmarks'
    expect(page).to have_link('Testing Updates', href: 'http://www.testingupdates.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in :url, with: 'http://www.checkingupdates.com'
    fill_in :title, with: 'Checking Updates'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Testing Updates', href: 'http://www.testing updates.com')
    expect(page).to have_link('Checking Updates', href: 'http://www.checkingupdates.com')
  end
end
