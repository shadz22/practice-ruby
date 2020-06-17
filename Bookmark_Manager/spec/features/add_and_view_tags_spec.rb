# require 'spec_helper'
# require 'pg'

# feature 'User can add and view tags' do
#   scenario 'add a tag for a bookmark' do
#     bookmark = Bookmark.create(url: "http://www.addtags.com", title: "To add a Tag")

#     visit '/bookmarks'
#     first('.bookmark').click_button 'Add Tag'

#     expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

#     fill_in :tag, with: 'Test Tag'
#     click_button 'Submit'

#     # expect(current_path).to eq '/bookmarks'
#     expect(first('.bookmark')).to have_content 'Test Tag'
    
#   end
# end