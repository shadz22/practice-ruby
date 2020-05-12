require 'spec_helper'

feature 'player is presented with the options' do
  scenario 'player can see the options on the screen' do
    sign_in_and_play
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end
end
