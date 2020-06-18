require 'spec_helper'
require 'tag'
require 'bookmark'
require 'bookmark_tag'

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

  describe '.where' do
    it 'returns all tags assigned to a specific bookmark id' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      tag1 = Tag.create(content: 'News')
      tag2 = Tag.create(content: 'Politics')

      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag2.id)

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first

      expect(tags.length).to eq 2
    end
  end
end