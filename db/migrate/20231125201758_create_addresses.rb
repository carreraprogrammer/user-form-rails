class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :house_or_apartment
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
