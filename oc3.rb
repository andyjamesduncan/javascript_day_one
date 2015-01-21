# OC3. Varys the mastermind

# We are going back to series, and you know that. And more concretely, we are going to explore the marvelous character of Varys,
# the Spider, from the Game of Thrones TV show (and obviously, from the Ice and Fire book saga).

# Varys is intelligent. He whispers. Not like a snake, but he whispers anyway. He knows secrets, he manages information, and in general
# he does a lot of stuff. No wonder he is bald, after all the stress.

# Someone, who definitely was not an Ironhack student, tried to compact some abilities that Varys has into a class, but there were two
# problems about that implementation. First… it works perfeclty, yeah but THE CODE IS A TOTAL MESS: unreadable, difficult to maintain,
# conventionless, and ugly. My eyes bled. Really.

# And second… it has no tests! This is a shame, and this Someone made me cry. He made me cry even more than after watching Derek, and
# realizing that I will have to wait almost a whole year until next season.

# Anyway, we are responsible people and we decide to improve this code. This exercise is composed of two parts:

# 1. Writing tests that validate the behaviour of all five methods of the Varys class. You should write several tests for the methods
# (except for the ones that return a simple String), exploring different parameter possibilities. Think hard!
# 2. Rewrite and refactor the code so it is way more readable, easier to maintain, and follows the conventions that we have been following
# at Ironhack. During the process of refactoring, use the specs in order to know you didn’t break anything.

require_relative 'Varys.rb'
require 'timecop'

describe Varys do

  before do
    @varys = Varys.new
  end

  describe "#Simple strings" do
    it "Say Varys" do
      result = @varys.say_my_name!()
      expect(result).to eq("I am Varys, and I'm here to say what you want to hear.")
    end
    it "Say Cersei" do
      result = @varys.say_cersei_rocks!()
      expect(result).to eq("Cersei rocks!")
    end
    it "Say Joffrey" do
      result = @varys.say_joffrey_rocks!()
      expect(result).to eq("Joffrey rocks!")
    end
  end
  describe "#List manipulators" do
    it "Five Letter Words Back" do
      result = @varys.backwards_wording(["Five", "Letter", "Words", "Reversed"])
      expect(result).to eq(["retteL", "sdroW", "desreveR"])
    end
  end
  describe "#Time is Friday or not Friday" do
    context "It is Friday" do
      before do
        Timecop.freeze(2015, 1, 23)
      end
      it "Friday" do
        result = @varys.friday_numbers([-1, -3, 0, 1, 2])
        expect(result).to eq([-1, -3])
      end
    end
    context "It is not Friday" do
      before do
        Timecop.freeze(2015, 1, 22)
      end
      it "Non-Friday behaviour" do
        result = @varys.friday_numbers([-1, -3, 0, 1, 2])
        expect(result).to eq([0, 1, 2])
      end
    end
  end
end