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
    @title = params[:title]
    @content = params[:content]
    erb(:content)
  end

  get '/daily_diary/content/edit_content' do
    @title = params[:title]
    @content = params[:content]
    erb(:edit_content)
  end

  post '/daily_diary/content/edit_content/submit' do
    "Hellow!"
    @title = params[:title]
    @content = params[:content]
    Entry.edit(title: @title, content: @content)
    redirect '/daily_diary'
  end

end
