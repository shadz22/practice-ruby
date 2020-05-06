require 'spec_helper'

feature 'register player name' do
  it 'shows the player name on the screen' do
    visit '/'
    fill_in :player_1_name, with: 'Shadi'
    click_button 'Submit'
    expect(page).to have_content 'Hello Shadi!'
  end
end
