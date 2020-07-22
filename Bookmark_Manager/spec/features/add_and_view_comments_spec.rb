require 'spec_helper'
require 'pg'

feature 'user can add and view comments' do
  scenario 'user adds a comment for a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Comment'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in :comment, with: 'This is a test comment'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content 'This is a test comment'

  end
end
