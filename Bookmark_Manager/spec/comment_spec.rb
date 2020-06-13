require 'comment'
require 'bookmark'
require 'database_helpers'

describe Comment do
  describe '.create' do
    it 'creates a comment for the bookmark' do
      bookmark = Bookmark.create(url: 'http://www.commentspectest.com', title: 'Comment Spec Test')
      comment = Comment.create(text: 'Comment for the spec test', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data['id']
      expect(comment.text).to eq 'Comment for the spec test'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'collects all the comments for a specific bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testingwhere.com', title: 'Testing .where')
      Comment.create(text: 'A comment to check the where method', bookmark_id: bookmark.id)
      Comment.create(text: 'A second test for the where method', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data['id']
      expect(comment.text).to eq 'A comment to check the where method'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end