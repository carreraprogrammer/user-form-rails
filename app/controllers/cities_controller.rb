class CitiesController < ApplicationController
  def index
    @cities = City.joins(:users).select('cities.*, COUNT(users.id) as user_count').group('cities.id')
  end

  def show
    @city = City.find(params[:id])
    @users = @city.users
  end
end
