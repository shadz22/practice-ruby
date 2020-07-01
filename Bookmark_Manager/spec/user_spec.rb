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

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test123@gmail.com', password: 'password123')
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

  describe '.authenticate' do
    it 'returns a user given the correct email and password' do
      user = User.create(email: 'testing@gmail.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'testing@gmail.com', password: 'passowrd123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if the email is not correct' do
      user = User.create(email: 'testing@gmail.com', password: 'password123')

      expect(User.authenticate(email: 'wrongemail@gmail.com', password: 'password123')).to be_nil
    end

  end
  
end