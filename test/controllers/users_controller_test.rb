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

  describe "create" do
    it "creates a new user if user has not been saved before" do
      # Arrange
      user_count = User.count

      # Act
      new_user = User.new(provider: "github", uid: "1123", username: "carmelina@email.com", email: "carmelina@email.com")

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(new_user))

      # Act-Assert
      expect {
        get auth_callback_path(:github)
      }.must_change "User.count", 1

      expect(flash[:status]).must_equal :success
      expect(flash[:result_message]).must_equal "Logged in as new user #{new_user.email}"

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end
end
