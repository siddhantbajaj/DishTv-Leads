class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :access_token
      t.float :latitude
      t.float :longitude
      t.string :email
      t.boolean :registered
      t.string   :number

      t.timestamps null: false
    end
  end
end
