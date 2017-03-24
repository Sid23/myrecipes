class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "giovanni", email: "giovanni@example.it", password: "password", password_confirmation: "password")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chef name should be present" do
    @chef.chefname = "abc"*11
    assert_not @chef.valid?
  end
  
  test "email should not be too long" do
    @chef.email = "as"*130
    assert_not @chef.valid?
  end

  test "emails should be rejected" do
    invalid_emails = %w[Fiwra@faf,it fgsdug@ui.io.com bil.gil@it]
    invalid_emails.each do |m|
      @chef.email = m
      assert_not @chef.valid?, "#{m.inspect} should be invalid"
    end
  end

  test "emails should be valid" do
    valid_emails = %w[user@example.com MASHRUR@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end
 
 test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    #save in order to check previous registered user
    @chef.save
    assert_not duplicate_chef.valid?
  end

  test "email should be lower case before hitting db" do
    mixed_email = "JohN@ExampLe.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email 
  end

  test "password should be present" do
    @chef.password = @chef.password_confirmation = " "
    assert_not @chef.valid?
  end
  
  test "password should be atleast 5 character" do
    @chef.password = @chef.password_confirmation = "x" * 4
    assert_not @chef.valid?
  end
end