require_relative 'SeriesMasterOfTheUniverse.rb'

# A new feature line

describe SeriesMasterOfTheUniverse do
	before do
		@smou = SeriesMasterOfTheUniverse.new
	end

	describe "#Number of hits" do
		it "Should say Cat is >= 200" do
			result = @smou.search_hits("Cat")
			expect(result).to be >= 200
		end
	end

	describe "#seasons" do
		it "Friends should have most seasons" do
			result = @smou.most_seasons(["Breaking Bad", "Friends", "Game of Thrones", "The Office"])
			expect(result).to eq("Friends")
		end
	end

	describe "#episodes" do
		it "Friends should have most episodes" do
			result = @smou.most_episodes(["Breaking Bad", "Friends", "Game of Thrones", "The Office"])
			expect(result).to eq("Friends")
		end
	end

	describe "#ratings" do
		it "Breaking Bad should have the highest rating" do
			result = @smou.highest_rating(["Pacific Blue", "Breaking Bad", "The Affair"])
			expect(result).to eq("Breaking Bad")
		end
	end

	describe "#top movies" do
		it "Top 1 movie" do
			result = @smou.top_movies(1)
			expect(result).to eq({	"1.\n    Cadena perpetua"=>9.3 } )
		end

		it "Top 3 movies" do
			result = @smou.top_movies(3)
			expect(result).to eq({	"1.\n    Cadena perpetua"=>9.3,
 									"2.\n    El padrino"=>9.2,
 									"3.\n    El padrino. Parte II"=>9.1} )
		end
	end
end



