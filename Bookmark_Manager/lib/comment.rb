require_relative './database_connection'

class Comment

  attr_reader :id, :text, :bookmark_id

  def initialize(id:, text:, bookmark_id:)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.create(text:, bookmark_id:)
    result = DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES ('#{text}', '#{bookmark_id}') RETURNING id, text, bookmark_id;")
    # p result.first
    Comment.new(
                id: result[0]['id'],
                text: result[0]['text'],
                bookmark_id: result[0]['bookmark_id']
              )
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = '#{bookmark_id}';")
    result.map do |comment|
      Comment.new(
                  id: result[0]['id'],
                  text: result[0]['text'],
                  bookmark_id: result[0]['bookmark_id'])
    end
  end
end