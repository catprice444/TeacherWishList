class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :cost
      t.string :name
      t.integer :amount_needed
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
