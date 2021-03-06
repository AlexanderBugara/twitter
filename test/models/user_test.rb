require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup 
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")  
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should not be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
  
   test "email should not be present" do
    @user.email = "  "
    assert_not @user.valid?
  end
  
  test "name should not be to long" do 
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email should not be to long" do 
    @user.email = "a" * 256
    assert_not @user.valid?
  end
  
  test "email should accept valid addresses" do 
    valid_address = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_address.each do |valid_address| 
      @user.email = valid_address
      assert @user.valid?, "address #{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addressess" do
    invalid_address = %w[user@example,com user_at_foo.org user.name@example foo@bar_baz.com foo@bar+baz.com]
    invalid_address.each do |invalid_address| 
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end
  
  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password should have a minimal length" do 
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
