require 'pg'

class Entry

  if ENV['RACK_ENV'] == 'test'
    @connection = PG.connect(dbname: 'daily_diary_test')
  else
    @connection = PG.connect(dbname: 'daily_diary')
  end

  attr_reader :id, :title, :content

  def initialize(id:, title:, content:)
    @id = id
    @title = title
    @content = content
  end

  def self.all
    result = @connection.exec( "SELECT * FROM entries")
    result.map do |entry|
      Entry.new(id: entry['id'], title: entry['title'], content: entry['content'])
    end
  end

  def self.create(title:, content:)
    result = @connection.exec("INSERT INTO entries (title, content) VALUES ('#{title}', '#{content}') RETURNING id, title, content;")
    Entry.new(id: result[0]['id'], title: result[0]['title'], content: result[0]['content'])
  end

  def self.edit(title:, content:)
    result = @connection.exec("UPDATE entries SET content = '#{content}' WHERE title = '#{title}'  RETURNING id, title, content;")
    Entry.new(id: result[0]['id'], title: result[0]['title'], content: result[0]['content'])
  end

end
