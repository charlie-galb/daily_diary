require 'pg'

class Entry

  def self.titles_to_links
    self.connect
    result = @connection.exec( "SELECT * FROM entries;")
    @title_array = result.map { |entry| entry = "<a href='/content?content=#{entry['content']}'>'#{entry['title']}'</a>" }
  end

  def self.create(title, content)
    self.connect
    @connection.exec("INSERT INTO entries (title, content) VALUES ('#{title}', '#{content}');")
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'daily_diary_test')
    else
      @connection = PG.connect(dbname: 'daily_diary')
    end
  end

end
