require 'bookmark'
require 'spec_helper'

describe Bookmark do
  describe '.all' do
    it 'shows all the bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include 'http://www.google.com'
      expect(bookmarks).to include 'http://www.bbc.co.uk'
      expect(bookmarks).to include 'http://www.msn.com'
    end
  end
end
