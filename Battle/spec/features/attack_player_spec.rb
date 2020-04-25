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