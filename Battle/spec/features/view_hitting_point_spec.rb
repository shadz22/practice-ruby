require 'spec_helper'

feature 'See opponents points' do
  scenario 'Display the opponents hit points' do
    sign_in_and_play
    expect(page).to have_content 'James: 60HP'
  end
end