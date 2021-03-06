require 'bookmark'
require 'spec_helper'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all the bookmarks' do

      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      Bookmark.create(url: 'http://www.msn.com', title: 'MSN')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
      
    end
  end

  describe '.create' do
    it 'adds a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter') # creates a hash of the new bookmark {"id"=>"591", "url"=>"http://www.twitter.com", "title"=>"Twitter"}
      persisted_data = persisted_data(table: 'bookmarks', id: bookmark.id)
    
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq 'http://www.twitter.com'
      expect(bookmark.title).to eq 'Twitter'
    end

    it "doesn't let the user to add invalid url" do
      Bookmark.create(url: 'not a valid url', title: 'not valid')
      expect(Bookmark.all).to be_empty
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.codecademy.com', title: 'Codecademy')
 
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'allows the user to edit a bookmark record' do
      bookmark = Bookmark.create(url: 'http://www.testing.com', title: 'Testing')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.checking.com', title: 'Checking')

      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Checking'
      expect(updated_bookmark.url).to eq 'http://www.checking.com'
    end
  end

  describe '.find' do
    it 'finds the specific bookmark based on the bookmark id' do
      bookmark = Bookmark.create(url: 'http://www.codecademy.com', title: 'Codecademy')
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Codecademy'
      expect(result.url).to eq 'http://www.codecademy.com'
    end
  end

  let(:comment_class) { double(:comment_class) }

  describe '#comments' do
    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(url: 'http://www.testingcomments.com', title: 'Testing Comments')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end
  end

  let(:tag_class) { double(:tag_class) }
  
  describe '#tags' do
    it 'calls .where on the Tag class' do
      bookmark = Bookmark.create(url: 'http://www.testing.com', title: 'Testing')
      expect(tag_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.tags(tag_class)
    end
  end

  describe '.where' do
    it 'returns all bookmarks that have the same tag' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      tag1 = Tag.create(content: 'tag1 test')
      tag2 = Tag.create(content: 'tag2 test')
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag2.id)

      bookmarks = Bookmark.where(tag_id: tag1.id)
      result = bookmarks.first

      expect(bookmarks.length).to eq 1
      expect(result.id).to eq bookmark.id
      expect(result.url).to eq bookmark.url
      expect(result.title).to eq bookmark.title
    end
  end
end
