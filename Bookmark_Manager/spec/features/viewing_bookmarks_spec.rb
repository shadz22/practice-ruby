require 'spec_helper'

feature 'Viewing bookmarks' do

  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'see the list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.bbc.co.uk'
    expect(page).to have_content 'http://www.msn.com'
  end
end
