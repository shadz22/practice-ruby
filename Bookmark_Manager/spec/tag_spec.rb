require 'spec_helper'
require 'tag'

describe Tag do

  describe '.create' do
    it 'creates a new tag' do
      tag = Tag.create(content: 'Testing a tag')

      persisted_data = persisted_data(table: 'tags', id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data['id']
      expect(tag.content). to eq 'Testing a tag'
    end
  end

  # describe '.where' do
  #   it 'returns all tags assigned to a specific bookmark id' do
end