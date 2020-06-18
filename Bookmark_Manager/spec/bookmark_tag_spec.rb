require 'spec_helper'
require 'bookmark_tag'
require 'database_helpers'

describe BookmarkTag do
  describe '.create' do
    it 'links the bookmark with the tag' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      tag = Tag.create(content: 'News')

      bookmark_tag = BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)

      expect(bookmark_tag).to be_a BookmarkTag
    end
  end
end
