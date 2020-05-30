require 'spec_helper'
require 'pg'

feature 'Viewing bookmarks' do

  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'see the list of bookmarks' do
    Bookmark.create(url: 'http://www.google.com')
    Bookmark.create(url: 'http://www.bbc.co.uk')
    Bookmark.create(url: 'http://www.msn.com')

    visit '/bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.bbc.co.uk'
    expect(page).to have_content 'http://www.msn.com'
  end
  
end
