require 'spec_helper'
require 'pg'

feature 'Viewing bookmarks' do

  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'see the list of bookmarks' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
    Bookmark.create(url: 'http://www.msn.com', title: 'MSN')

    visit '/bookmarks'
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
    expect(page).to have_link('MSN', href: 'http://www.msn.com')
  end

end
