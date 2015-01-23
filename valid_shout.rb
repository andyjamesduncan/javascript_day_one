require_relative 'shouter.rb'

describe Shout do
  before do

    puts "Starting Shout"

  	@user = User.new
  	@user.name = 'Sean'
  	@user.handle = 'seaniechaos'
  	@user.password = @user.generate_unique_password

    @user.save

    @shout = Shout.new
    @shout.user = @user
    @shout.message = "A valid test message"
    @shout.created_at = @shout.generate_created_at
    @shout.likes = @shout.initial_likes

    puts "Shout User ID   : " + @shout.user_id.to_s
    puts "Shout Message   : " + @shout.message.to_s
    puts "Shout Created At: " + @shout.created_at.to_s
    puts "Shout Likes     : " + @shout.likes.to_s

  end

  describe "totally valid shout" do
    it "should be valid because all data correct" do
      	expect(@shout.valid?).to be_truthy
    end
  end
  describe "message" do
    it "should be invalid if there is no message" do
        @shout.message = nil
      	expect(@shout.valid?).to be_falsy
    end
    it "should be invalid because message less than 1 character long" do
        @shout.message = ""
        expect(@shout.valid?).to be_falsy
    end
    it "should be invalid because message is more than 200 characters long" do
        @shout.message = "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
        expect(@shout.valid?).to be_falsy
    end
  end
  describe "likes" do
    it "should be invalid if there is no likes value" do
        @shout.likes = nil
        expect(@shout.valid?).to be_falsy
    end
    it "should be invalid because likes less than zero" do
        @shout.likes = -1
        expect(@shout.valid?).to be_falsy
    end
    it "should be invalid because message is more than 200 characters long" do
        @shout.message = "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
        expect(@shout.valid?).to be_falsy
    end
  end
  describe "user_id" do
    it "should be invalid if there is no user_id value" do
        @shout.user_id = nil
        expect(@shout.valid?).to be_falsy
    end
  end
end 