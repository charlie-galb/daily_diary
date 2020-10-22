require 'pg'

class Entry

  def self.all
    connection = PG.connect(dbname: 'daily_diary')

    result = connection.exec( "SELECT * FROM entries;")
    result.map { |entry| [entry['title'], entry['content']] }
  end

  def self.create(title, content)
    connection = PG.connect(dbname: 'daily_diary')
    connection.exec("INSERT INTO entries (title, content) VALUES ('#{title}', '#{content}');")

  end

end
