class User < ApplicationRecord
  belongs_to :gender
  belongs_to :city, counter_cache: true
  belongs_to :country
  belongs_to :state

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :birth_date, presence: true
  validates :address, presence: true
  validates :house_or_apartment, presence: true
  validates :city_id, presence: true
  validates :country_id, presence: true
  validates :state_id, presence: true
  validates :gender_id, presence: true
  validate :must_be_over_18
  validate :maximum_three_users_per_city, on: :create, unless: -> { city.nil? }

  def must_be_over_18
    if birth_date.present? && birth_date > 18.years.ago.to_date
      errors.add(:birth_date, 'Debes ser mayor de 18 años')
    end
  end

  def maximum_three_users_per_city
    if city.users_count >= 3
      errors.add(:city, 'La ciudad ya tiene 3 usuarios registrados')
    end
  end

  private
end
