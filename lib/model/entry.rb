require 'pg'

class Entry

  if ENV['RACK_ENV'] == 'test'
    @connection = PG.connect(dbname: 'daily_diary_test')
  else
    @connection = PG.connect(dbname: 'daily_diary')
  end

  def self.all
    result = @connection.exec( "SELECT * FROM entries;")
    @entry_array = result.map { |entry| [entry['title'], entry['content']] }
  end

  def self.link
    result = @connection.exec( "SELECT * FROM entries;")
    @title_array = result.map { |entry| entry = "<a href='/content'>'#{entry['title']}'</a>" }
  end


  # def self.all_titles
  #   @titles = @connection.exec( "SELECT title FROM entries;")
  #   @titles.map { |title| }
  # end

  def self.create(title, content)
    @connection.exec("INSERT INTO entries (title, content) VALUES ('#{title}', '#{content}');")
  end

end
