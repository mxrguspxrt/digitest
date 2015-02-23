class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.timestamps null: false

      t.integer :from_account_id
      t.integer :to_account_id
      t.integer :amount
    end
  end
end
