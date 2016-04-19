#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:lepra.db"

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
end

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end

class User < ActiveRecord::Base
	has_many :posts
	has_many :comments 
end

get '/' do
	erb :index
end