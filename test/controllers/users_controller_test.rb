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
end
