require 'pg'

class Entry

  def self.all
    connection = PG.connect(dbname: 'daily_diary')

    result = connection.exec( "SELECT * FROM entries;")
    result.map { |entry| [entry['title'], entry['content']] }
  end

end
