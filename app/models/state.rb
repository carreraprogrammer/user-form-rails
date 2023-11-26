class State < ApplicationRecord
  belongs_to :country
  has_many :cities
  has_many :users
end
