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
      expect(bookmark_tag.bookmark_id).to eq bookmark.id
      expect(bookmark_tag.tag_id).to eq tag.id
    end
  end
end
