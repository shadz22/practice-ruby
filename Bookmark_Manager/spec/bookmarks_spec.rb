require 'bookmark'
require 'spec_helper'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bbc.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.msn.com');")

      bookmarks = Bookmark.all
      
      expect(bookmarks).to include 'http://www.google.com'
      expect(bookmarks).to include 'http://www.bbc.co.uk'
      expect(bookmarks).to include 'http://www.msn.com'
    end
  end
end
