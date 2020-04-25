require 'spec_helper'

feature 'Attack player 2' do
  scenario 'get confirmation of the attack' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Shadi Attacked James'
  end
end