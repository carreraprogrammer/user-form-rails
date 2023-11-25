class User < ApplicationRecord
  belongs_to :gender
  belongs_to :address
  belongs_to :state
  belongs_to :country
  belongs_to :city, counter_cache: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :birth_date, presence: true
  validate :must_be_over_18
  validate :maximum_three_users_per_city

  def must_be_over_18
    if birth_date.present? && birth_date > 18.years.ago.to_date
      errors.add(:birth_date, 'You must be over 18 years old to register.')
    end
  end

  def maximum_three_users_per_city
    if city.users_count >= 3
      errors.add(:city, 'Cannot register more than three users from the same city.')
    end
  end
end
