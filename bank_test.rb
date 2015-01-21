require_relative 'Banker.rb'

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

describe Banker do

	describe "#convert from euro" do
		it "euro to euro" do
			result = Banker.convert(100, 'eur', 'eur')
			expect(result).to eq(100)
		end
		it "euro to usd" do
			result = Banker.convert(100, 'eur', 'usd')
			expect(result).to eq(128.356)
		end
		it "euro to gbp" do
			result = Banker.convert(100, 'eur', 'gbp')
			expect(result).to eq(78.478)
		end
		it "euro to cad" do
			result = Banker.convert(100, 'eur', 'cad')
			expect(result).to eq(141.613)
		end
		it "euro to aud" do
			result = Banker.convert(100, 'eur', 'aud')
			expect(result).to eq(144.651)
		end
	end

	describe "#convert to euro" do
		it "euro to euro" do
			result = Banker.convert(100, 'eur', 'eur')
			expect(result).to eq(100)
		end
		it "usd to euro" do
			result = Banker.convert(100, 'usd', 'eur')
			expect(result).to eq(77.818)
		end
		it "gbp to euro" do
			result = Banker.convert(100, 'gbp', 'eur')
			expect(result).to eq(127.341)
		end
		it "cad to euro" do
			result = Banker.convert(100, 'cad', 'eur')
			expect(result).to eq(70.518)
		end
		it "aud to euro" do
			result = Banker.convert(100, 'aud', 'eur')
			expect(result).to eq(69.052)
		end
	end
end

# OC2. Money, money, money

# We were going back home yesterday. Second week, Monday, rain, new teacher... But just before getting into the subway, we found a bag full of
# money in different currencies! So we skipped TV shows for now (we’ll be back sometime, don’t worry!) because, don’t know why, we were
# suddenly interested in money.

# So we got to our local dealer, knowing that either way he will have a cut of the deal, but anyway we asked him about the current rates.
# And instead of using his services, we decided we wanted to get home, and write an awesome currency converter so we could know how much
# money was in the bag.

# Let’s do it now!

# You already have a little skeleton class with currency exchanges from and to €. Note that converting from/to € is direct, but if none
# of the from/to currencies is the € you have to do two conversions, using the € as a bridge.

# The only condition is: write ALL the tests first. Go full TDD on it. Yeah, all tests first. All of them. Yeah, every single one. Every.
# Single. One. Got it? One more time: every single one. And then, when everything is failing and so on... go implement it.

# Feel free to add support for your country currency! :)

