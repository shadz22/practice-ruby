require 'spec_helper'

feature 'play the game' do

  before do
    visit '/'
    fill_in :player_1_name, with: 'Shadi'
    click_button 'Submit'
  end

  scenario 'player can see the shape options on the screen' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'player chooses an option' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock'
  end

  scenario 'computer chooses an option' do
    click_button 'Rock'
    message = find(:css,'#computer').text
    expect(possible_message).to include message
  end
end
