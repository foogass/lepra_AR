class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |p|
  		p.text :header
  		p.text :content
  		p.belongs_to :user, index: true
  		p.timestamps null: false
  	end
  end
end
