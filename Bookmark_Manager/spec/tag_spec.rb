require 'spec_helper'
require 'tag'
require 'bookmark'
require 'bookmark_tag'

describe Tag do

  let(:bookmark_class) { double(:bookmark_class) }

  describe '.create' do
    context "tag doesn't exist" do
      it 'creates a new tag' do
        tag = Tag.create(content: 'Testing a tag')

        persisted_data = persisted_data(table: 'tags', id: tag.id)

        expect(tag).to be_a Tag
        expect(tag.id).to eq persisted_data['id']
        expect(tag.content). to eq 'Testing a tag'
      end
    end
    context 'tag already exists' do
      it 'return the existing tag' do
        tag1 = Tag.create(content: 'Testing a tag')
        tag2 = Tag.create(content: 'Testing a tag')

        expect(tag2.id).to eq tag1.id
      end
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
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end

  describe '.find' do
    it 'finds all the tags with the same id' do
      tag = Tag.create(content: 'Test tag')
      result = Tag.find(id: tag.id)

      expect(result.id).to eq tag.id
      expect(result.content).to eq 'Test tag'
    end
  end

  describe '#bookmarks' do
    it 'calls .where on the Bookmark class' do
      tag = Tag.create(content: 'Test tag')

      expect(bookmark_class).to receive(:where).with(tag_id: tag.id)
      tag.bookmarks(bookmark_class)
    end
  end

end
