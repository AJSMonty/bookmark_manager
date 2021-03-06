require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    create_db_connection

    result = @connection.exec "SELECT * FROM bookmarks"
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    create_db_connection
    result = @connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    create_db_connection
    result = @connection.exec("DELETE FROM bookmarks WHERE id=#{id}")
  end

  def self.find(id:)
    create_db_connection
    result = @connection.exec("SELECT * FROM bookmarks WHERE id = #{id}")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.update(id:, new_title:, new_url:)
    create_db_connection
    result = @connection.exec("UPDATE bookmarks SET title = '#{new_title}' WHERE id=#{id}")
    result = @connection.exec("UPDATE bookmarks SET url = '#{new_url}' WHERE id=#{id}")
  end

  private

  def self.create_db_connection
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      @connection = PG.connect :dbname => 'bookmark_manager'
    end
  end

end
