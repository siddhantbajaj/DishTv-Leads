class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :lead_id
      t.float :price
      t.timestamps null: false
    end
  end
end
