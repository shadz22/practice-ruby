require 'spec_helper'

feature 'Viewing bookmarks' do
  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end
