require 'spec_helper'
require 'pg'

feature 'User can add and view tags' do
  scenario 'add a tag for a bookmark' do
    bookmark = Bookmark.create(url: "http://www.addtags.com", title: "Test Tag")

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Tag'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"
    
  end
end