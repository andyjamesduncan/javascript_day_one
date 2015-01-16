class FakeHash

	attr_accessor :storage_hash

	def initialize

		@storage_hash = {}
		@storage_hash[:fruit] = "Oranges";
		@storage_hash[:doodah] = "Fingers";
		
	end

	def method_missing (m, *args, &block)

		local_array = *args

		size_of_array = local_array.size

		if size_of_array > 0

			@storage_hash[m] = local_array[0]
			return

		else
			puts @storage_hash[m]
			return @storage_hash[m]
		end
		
	end

end

fakehash = FakeHash.new

fakehash.whatever(3)

puts fakehash.whatever


fakehash.seanisagod("12 inches")

puts "How big is Sean? " + fakehash.doodah