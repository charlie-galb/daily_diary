require 'sinatra/base'
require_relative './model/entry'

class DailyDiary < Sinatra::Base

  before do
    @diary_entries = Entry.all
  end

  get '/' do
    @title = Entry.link
    erb(:index)
  end

  post '/new_entry' do
    Entry.create(params[:title], params[:content])
    redirect '/'
  end

  get '/content' do
    'Is this working?'
  end

end
