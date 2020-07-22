# frozen_string_literal: true

require 'spec_helper'

feature 'Testing infraustructure' do
  scenario 'Can check homepage content' do
    visit '/'
    expect(page).to have_content 'Welcome to Battle!'
  end
end
