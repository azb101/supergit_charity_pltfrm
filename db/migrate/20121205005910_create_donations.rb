class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :donator_id
      t.integer :amount
      t.datetime :date

      t.timestamps
    end
  end
end
