class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |c|
  		c.text :content
  		c.belongs_to :user, index: true
  		c.belongs_to :post, index: true
  		c.timestamps null: false
  	end
  end
end
