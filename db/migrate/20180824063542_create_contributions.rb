class CreateContributions < ActiveRecord::Migration
  def change 
    create_table :contributions do |t|
      t.string :nameJ
      t.string :nameE
      t.string :detail
      t.string :email_adress
      t.string :phone_number
      t.string :photo_url
      t.string :memo
      t.timestamps null: false
    end
  end
end
