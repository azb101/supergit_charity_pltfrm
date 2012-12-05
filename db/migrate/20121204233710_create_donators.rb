class CreateDonators < ActiveRecord::Migration
  def change
    create_table :donators do |t|
      t.string :name
      t.string :info

      t.timestamps
    end
  end
end
