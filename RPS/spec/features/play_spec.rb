require 'spec_helper'

feature 'play the game' do
  PLAY_SEED = 121

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

  scenario 'computer chooses "Rock"' do
    click_button 'Rock'
    message = find(:css, '#computer').text
    expect(possible_message).to include message
  end

  scenario 'computer choses a random shape' do
    srand(PLAY_SEED)
    click_button 'Rock'
    expect(page).to have_content "Computer chose Scissors"
  end
end
