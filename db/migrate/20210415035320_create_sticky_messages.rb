class CreateStickyMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :sticky_messages do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.references :sticky, polymorphic: true
      t.timestamps
    end
  end
end
