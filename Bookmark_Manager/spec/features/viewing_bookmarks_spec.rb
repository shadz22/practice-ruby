require 'spec_helper'
require 'pg'

feature 'Viewing bookmarks' do

  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'see the list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.msn.com');")
    
    visit '/bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.bbc.co.uk'
    expect(page).to have_content 'http://www.msn.com'
  end
end
