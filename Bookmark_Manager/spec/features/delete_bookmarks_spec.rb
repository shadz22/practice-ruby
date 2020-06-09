require 'spec_helper'
require 'pg'

feature 'Delete a bookmark' do
  scenario 'user can delete a bookmark from the list' do
    Bookmark.create(url: 'http://www.testing.com', title: 'Testing')
    visit '/bookmarks'
    expect(page).to have_link('Testing', href: 'http://www.testing.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Testing', href: 'http://www.testing.com')
  end
end
