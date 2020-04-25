require 'spec_helper'

feature 'Enter player' do
  scenario 'Users enter their names via a form' do
    sign_in_and_play
    expect(page).to have_content "Shadi Vs James"
  end
end