require 'spec_helper'

feature 'player is presented with the options' do
  scenario 'player can see the options on the screen' do
    visit '/'
    fill_in :player_1_name, with: 'Shadi'
    click_button 'Submit'
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end
end
