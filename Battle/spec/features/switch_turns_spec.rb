require 'spec_helper'

feature 'Switch between players' do
  scenario 'Player 1 is first to attack' do
    sign_in_and_play
    expect(page).to have_content "Shadi's turn"
  end

  scenario 'after player 1 attacks' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content 'Shadi\'s turn'
    expect(page).to have_content "James' turn"
    
  end
end