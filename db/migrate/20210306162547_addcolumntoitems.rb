class Addcolumntoitems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :units_donated, :integer
  end
end
