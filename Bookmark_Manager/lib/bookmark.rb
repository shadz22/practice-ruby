require_relative 'database_connection'
require_relative 'comment'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('bookmark_manager_test')
    else
      DatabaseConnection.setup('bookmark_manager')
    end
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark| # by using map we turn the database object into an array, where each bookmark hash is an element of the array                               
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    }    
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('bookmark_manager_test')
    else
      DatabaseConnection.setup('bookmark_manager')
    end
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
