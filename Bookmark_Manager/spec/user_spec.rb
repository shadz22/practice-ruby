require 'user'
require 'spec_helper'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'creates a new user after sign up' do
      user = User.create(email: 'test123@gmail.com', password: 'password123')
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user.id).to eq persisted_data['id']
      expect(user).to be_a User
      expect(user.email).to eq 'test123@gmail.com'
    end
  end
  
end