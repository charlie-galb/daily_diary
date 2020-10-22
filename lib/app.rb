require 'sinatra/base'
require_relative './model/entry'

class DailyDiary < Sinatra::Base

  get '/' do
    @titles = Entry.titles_to_links
    erb(:index)
  end

  post '/new_entry' do
    Entry.create(params[:title], params[:content])
    redirect '/'
  end

  get '/content' do
    @content = params[:content]
  end

end
