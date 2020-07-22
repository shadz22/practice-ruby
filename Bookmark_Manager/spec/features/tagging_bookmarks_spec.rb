require 'spec_helper'
require 'pg'

feature 'User can add and view tags' do
  scenario 'add a tag for a bookmark' do
    bookmark = Bookmark.create(url: "http://www.addtags.com", title: "To add a Tag")

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Tag'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

    fill_in :tag, with: 'Test Tag'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content 'Test Tag'
    
  end
end

feature 'to see all the bookmarks that have a same tag' do
  scenario 'adding the same tags to different bookmarks and then filtering by that tag' do
    Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'http://www.msn.com', title: 'MSN')
    Bookmark.create(url: 'http://www.udemy.com', title: 'Udemy')

    visit '/bookmarks'

    within page.find('.bookmark:nth-of-type(1)') do
      click_button 'Add Tag'
    end

    fill_in :tag, with: 'Test tag'
    click_button 'Submit'

    within page.find('.bookmark:nth-of-type(2)') do
      click_button 'Add Tag'
    end

    fill_in :tag, with: 'Test tag'
    click_button 'Submit'

    first('.bookmark').click_link 'Test tag'

    expect(page).to have_link 'Twitter', href: 'http://www.twitter.com'
    expect(page).to have_link 'MSN', href: 'http://www.msn.com'
    expect(page).not_to have_link 'Udemy', href: 'http://www.udemy.com'
  end
end
