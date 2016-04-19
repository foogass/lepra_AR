#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:lepra.db"

class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :post
end

get '/' do
	@results = Post.order 'created_at DESC'
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	@post = Post.new params[:post]
	@post.save
end