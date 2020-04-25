require 'spec_helper'

feature 'See opponents points' do
  scenario 'Display the opponents hit points' do
    visit '/'
    fill_in :player1_name, with: 'Shadi'
    fill_in :player2_name, with: 'James'
    click_button 'Submit'
    expect(page).to have_content 'James: 60HP'
  end
end