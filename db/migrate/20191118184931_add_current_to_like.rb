class AddCurrentToLike < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :current, :integer
  end
end
