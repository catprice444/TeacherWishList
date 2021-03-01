class FixUserColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_type, :role
  end
end
