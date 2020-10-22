require 'sinatra/base'
require 'model/entry'

class DailyDiary < Sinatra::Base

  before do
    @diary_entries = Entry.all
  end

  get '/' do
    erb(:index)
  end

end
