class User < ApplicationRecord
  belongs_to :gender
  belongs_to :address
  belongs_to :state
  belongs_to :country
  belongs_to :city
end
