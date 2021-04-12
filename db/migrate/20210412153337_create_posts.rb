class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.string :status
      t.string :priority
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end
