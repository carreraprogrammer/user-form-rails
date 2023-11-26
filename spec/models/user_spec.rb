require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:country) { Country.create!(name: 'United States') }
  let!(:state) { State.create!(name: 'California', country: country) }
  let!(:city) { City.create!(name: 'Los Angeles', state: state) }
  let!(:gender) {Gender.create!(description: 'male')}
  subject { User.create!(first_name: 'John', last_name: 'Doe', birth_date: 20.years.ago.to_date, email: 'examle@example.com', city:, state: state, country: country, gender:, address: 'address address adress', house_or_apartment: 'house') }
  

  describe 'validations' do
    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should validate_presence_of(:address) }

    it { should validate_presence_of(:house_or_apartment) }
  end

  context 'email format' do
    it 'is invalid with an incorrect email format' do
      subject.email = 'invalid'
      expect(subject.valid?).to be false
      expect(subject.errors[:email]).to include('is invalid')
    end

    it 'is valid with a correct email format' do
      subject.email = 'valid@example.com'
      expect(subject.valid?).to be true
    end
  end

  context 'age should be over 18' do
    it 'is invalid with a birth date less than 18 years ago' do
      subject.birth_date = 17.years.ago.to_date
      expect(subject.valid?).to be false
      expect(subject.errors[:birth_date]).to include('You must be over 18 years old to register.')
    end

    it 'is valid with a birth date more than 18 years ago' do
      subject.birth_date = 19.years.ago.to_date
      expect(subject.valid?).to be true
    end
  end

  context 'maximum three users per city' do
    let!(:users) do
      3.times.map do |i|
        User.create!(
          first_name: "User",
          last_name: "Doe",
          birth_date: 20.years.ago.to_date,
          email: "user#{i}@example.com",
          address: '123 Main St',
          house_or_apartment: 'Apartment',
          gender: gender,
          city: city,
          state: state,
          country: country
        )
      end
    end

    it 'does not allow more than three users in the same city' do
      new_user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        birth_date: 20.years.ago.to_date,
        email: 'jane@example.com',
        address: '456 Elm St',
        house_or_apartment: 'House',
        gender: gender,
        city: city,
        state: state,
        country: country
      )
      expect(new_user.valid?).to be false
      expect(new_user.errors[:city]).to include('Cannot register more than three users from the same city.')
    end
  end
end