class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :email
      t.string :address
      t.string :house_or_apartment
      t.belongs_to :gender, null: false, foreign_key: true
      t.belongs_to :city, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true
      t.belongs_to :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
