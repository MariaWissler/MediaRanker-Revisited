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

    it "will redirect and give a flash notice for an invalid user" do
      # Act
      get user_path(-1)
      # Assert
      must_respond_with :not_found
      must_respond_with 404
    end
  end

  describe "login" do
    it "log in existing user" do
      user = users(:dan)

      expect {
        perform_login(user)
      }.wont_change "User.count"
    end
  end
end
