require 'sinatra/base'
require_relative './model/entry'

class DailyDiary < Sinatra::Base

  get '/' do
    @titles = Entry.all
    erb(:index)
  end

  post '/new_entry' do
    Entry.create(title: params[:title], content: params[:content])
    redirect '/'
  end

  get '/content' do
    @content = params[:content]
  end

end
