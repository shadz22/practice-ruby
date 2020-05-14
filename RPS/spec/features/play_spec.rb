require 'spec_helper'

feature 'play the game' do
  scenario 'player can see the shape options on the screen' do
    sign_in_and_play
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'player chooses an option' do
    sign_in_and_play
    click_button 'Rock'
    expect(page).to have_content 'You have chosen Rock'
  end
end
