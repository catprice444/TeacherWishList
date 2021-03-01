class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :user_type
      t.integer :donation_amount

      t.timestamps
    end
  end
end
