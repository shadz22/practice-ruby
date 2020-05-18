def sign_in_and_play
  visit '/'
  fill_in :player_1_name, with: 'Shadi'
  click_button 'Submit'
end

def possible_message
  [:rock, :paper, :scissors].map { |shape| "Computer chose #{shape.to_s.capitalize}" }
end
