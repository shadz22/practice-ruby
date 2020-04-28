require 'spec_helper'

feature 'Attack player 2' do
  scenario 'get confirmation of the attack' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Shadi Attacked James'
  end
end

feature 'Deduct Hit points' do
  scenario 'when attacked, 10 points gets deducted' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'James: 50HP'
  end
end

feature 'Player 2 attacks player 1' do
  scenario 'player 1 see the confirmation of the attack' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    expect(page).to have_content 'Shadi: 50HP'
  end
end