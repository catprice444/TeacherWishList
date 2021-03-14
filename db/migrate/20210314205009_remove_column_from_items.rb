class RemoveColumnFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :units_donated
  end
end
