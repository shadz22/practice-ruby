require 'spec_helper'

feature 'register player name' do
  it 'shows the player name on the screen' do
    sign_in_and_play
    expect(page).to have_content 'Shadi Vs Computer'
  end
end
