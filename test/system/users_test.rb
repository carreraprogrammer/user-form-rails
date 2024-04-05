require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Address", with: @user.address
    fill_in "Birth date", with: @user.birth_date
    fill_in "City", with: @user.city_id
    fill_in "Country", with: @user.country_id
    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Gender", with: @user.gender_id
    fill_in "House or apartment", with: @user.house_or_apartment
    fill_in "Last name", with: @user.last_name
    fill_in "State", with: @user.state_id
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Address", with: @user.address
    fill_in "Birth date", with: @user.birth_date
    fill_in "City", with: @user.city_id
    fill_in "Country", with: @user.country_id
    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Gender", with: @user.gender_id
    fill_in "House or apartment", with: @user.house_or_apartment
    fill_in "Last name", with: @user.last_name
    fill_in "State", with: @user.state_id
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
