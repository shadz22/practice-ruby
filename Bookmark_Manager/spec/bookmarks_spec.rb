require 'bookmark'
require 'spec_helper'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

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
      bookmark = Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter') #creates a hash of the new bookmark {"id"=>"591", "url"=>"http://www.twitter.com", "title"=>"Twitter"}
      persisted_data = persisted_data(id: bookmark.id)
    
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq 'http://www.twitter.com'
      expect(bookmark.title).to eq 'Twitter'
    end
  end
end
