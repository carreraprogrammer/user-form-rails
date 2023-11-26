class CitiesController < ApplicationController
  def index
    @cities = City.joins(:users).select('cities.*, COUNT(users.id) as user_count').group('cities.id')
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "cities/index", formats: [:html], layout: "pdf"
      end
    end
  end

  def show
    @city = City.find(params[:id])
    @users = @city.users
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Users in #{@city_name}", template: "cities/city", formats: [:html], layout: "pdf"
      end
    end
  end
end
