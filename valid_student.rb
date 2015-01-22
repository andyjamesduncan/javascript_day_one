require_relative 'Student.rb'

describe Student do
  before do
  	@student = Student.new
  	@student.name = 'Sean'
  	@student.surnames = 'Ring'
  	@student.website = 'http://www.seanring.com'
  	@student.number_of_dogs = 1
  	@student.birthday = 20.years.ago
  end

  describe "totally valid student" do
    it "should be valid because all data correct" do
      	expect(@student.valid?).to be_truthy
    end
  end
  describe "name" do
    it "should be invalid if there is no name" do
    	@student.name = nil
      	expect(@student.valid?).to be_falsy
    end
  end
  describe "surnames" do
    it "should be invalid if there is no surnames" do
    	@student.surnames = nil
      	expect(@student.valid?).to be_falsy
    end
  end
  describe "website format" do
    it "should be invalid because no http" do
    	@student.website = 'www.seanring.com'
      	expect(@student.valid?).to be_falsy
    end
  end
  describe "number of dogs" do
    it "should be invalid because no dogs" do
    	@student.number_of_dogs = 0
      	expect(@student.valid?).to be_falsy
    end
  end
  describe "proper age" do
    it "should be invalid because student too young" do
    	@student.birthday = 15.years.ago
      	expect(@student.valid?).to be_falsy
    end
  end
  describe "totally valid student" do
    it "should be valid because all data should now be correct" do
      	expect(@student.valid?).to be_truthy
    end
  end
  describe "complete name" do
    it "full name separated by spaces" do
      	expect(@student.complete_name).to eq('Sean Ring')
    end
  end
  describe "Not to be called Xavier" do
    it "lower case" do
    	@student.name = 'xavier'
      	expect(@student.valid?).to be_falsy
    end
    it "upper case" do
    	@student.name = 'XAVIER'
      	expect(@student.valid?).to be_falsy
    end
    it "mixed case" do
    	@student.name = 'Xavier'
      	expect(@student.valid?).to be_falsy
    end
  end
end 