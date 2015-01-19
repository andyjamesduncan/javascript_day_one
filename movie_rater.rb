require_relative 'SeriesMasterOfTheUniverse.rb'

# A new feature line

describe SeriesMasterOfTheUniverse do
	before do
		@smou = SeriesMasterOfTheUniverse.new
	end

	describe "#ratings" do
		it "Should rate Star Trek" do
			result = @smou.series_rating("Star Trek")
			expect(result).to eq(8.0)
		end
		it "Should rate Firefly" do
			result = @smou.series_rating("Firefly")
			expect(result).to eq(9.2)
		end
		it "Should rate Big Bang" do
			result = @smou.series_rating("Big Bang")
			expect(result).to eq(8.6)
		end
		it "Should rate Lost" do
			result = @smou.series_rating("Lost")
			expect(result).to eq(8.5)
		end
	end

	describe "#best series" do
		it "Should find best series" do
			result = @smou.best_series( [ "Star Trek", "Big Bang", "Firefly", "Lost" ] )
			expect(result).to eq("Firefly")
		end
	end

	describe "#worst series" do
		it "Should find worst series" do
			result = @smou.worst_series( [ "Star Trek", "Big Bang", "Firefly", "Lost" ] )
			expect(result).to eq("Star Trek")
		end
	end
end



