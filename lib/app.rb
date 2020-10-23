require 'sinatra/base'
require_relative './model/entry'

class DailyDiary < Sinatra::Base

  get '/daily_diary' do
    @titles = Entry.all
    erb(:index)
  end

  post '/daily_diary/new_entry' do
    Entry.create(title: params[:title], content: params[:content])
    redirect '/daily_diary'
  end

  get '/daily_diary/content' do
    @content = params[:content]
  end

end
