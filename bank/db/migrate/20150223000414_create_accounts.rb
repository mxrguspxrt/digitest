class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.timestamps null: false

      t.integer :balance_cents
      t.integer :user_id
    end
  end
end
