class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :picture
      t.integer :user_id
      t.timestamps
    end
  end
end
