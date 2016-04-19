class CreatePosts < ActiveRecord::Migration
  def change
   	create_table :posts do |p|
  		p.text :content
  		p.string :user
  		p.timestamps null: false
  	end
  end
end