require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    bookmarks = connection.exec('SELECT * FROM bookmarks;')
    bookmarks.map { |bookmark|  # by using map we turn the databse object into an array, where each bookmark hash is an element of the array                               
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])}
    
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  
  end
end
