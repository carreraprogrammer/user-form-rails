class CitiesController < ApplicationController
  def index
    @cities = City.joins(:users).select('cities.*, COUNT(users.id) as user_count').group('cities.id')

    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "file_name", template: "cities/index", formats: [:html], layout: "pdf", orientation: 'Landscape'
      end
    end
  end

  def show
    @city = City.includes(users: [{city: [{state: :country}]}, :gender]).find(params[:id])

    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "Users in #{@city_name}", template: "cities/city", formats: [:html], layout: "pdf", orientation: 'Landscape'
      end
    end
  end
end
