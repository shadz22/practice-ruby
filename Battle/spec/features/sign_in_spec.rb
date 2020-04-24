require 'spec_helper'

feature 'Enter player' do
  scenario 'Users enter their names via a form' do
    visit '/'
    fill_in :player1, with: "Shadi"
    fill_in :player2, with: "James"
    click_button 'Submit'
    expect(page).to have_content "Shadi Vs James"
  end
end