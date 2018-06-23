class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string   :workflow_state
      t.integer  :user_id
      t.string   :source
      t.string   :type
      t.integer  :rating
      t.float    :latitude
      t.float    :longitude
      t.string   :name
      t.string   :number
      t.float    :base_price
      t.float    :actual_price

      t.timestamps null: false
    end
  end
end
