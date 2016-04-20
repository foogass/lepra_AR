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
	redirect to '/'
end

get '/post/:id' do
	@post = Post.find params[:id]
	@comments = Comment.order 'created_at DESC'
	erb :post
end 

post '/post/:id' do
	@post = Post.find params[:id]
	@comment = @post.Comment.new params[:comment]
	@comment.save
end