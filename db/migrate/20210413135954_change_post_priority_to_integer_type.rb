class ChangePostPriorityToIntegerType < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :priority, :integer
  end
end
