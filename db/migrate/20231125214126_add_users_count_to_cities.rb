class AddUsersCountToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :users_count, :integer, default: 0, null: false

    City.find_each do |city|
      City.reset_counters(city.id, :users)
    end
  end
end
