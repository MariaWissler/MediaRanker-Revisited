require "test_helper"

describe UsersController do
  describe "index" do
    it "should get index" do
      # Act
      get users_path
      # Assert
      must_respond_with :success
    end
  end

  describe "show" do
    it "can get a valid user" do
      # Act
      get user_path(users(:kari).id)
      # Assert
      must_respond_with :success
    end
  end
end
