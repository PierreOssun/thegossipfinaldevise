class CreateGossips < ActiveRecord::Migration[5.1]
  def change
    create_table :gossips do |t|
      t.text :content
      t.string :user_name
      t.integer "user_id"
      t.timestamps
    end
  end
end
