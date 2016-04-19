class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |u|
  		u.string :name
  		u.timestamps null: false
  	end
  end
end
