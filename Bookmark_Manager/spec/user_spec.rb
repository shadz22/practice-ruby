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

  describe '.find' do
    it 'returns nil if no user-id has been given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds the user based on the user id' do
      user = User.create(email: 'testing@gmail.com', password: 'password123')
      result = User.find(user.id)

      expect(user.id).to eq result.id
      expect(user.email).to eq result.email
    end
  end
  
end