class Numermaster

	attr_accessor :n_arr

	def array_handler(input_arr)

		@n_arr = input_arr

		positive_arr = []
		negative_arr = []

		@n_arr.each do |element|

			element >= 0 ? positive_arr.push(element) : negative_arr.push(element)

		end

		return nil if positive_arr.size == negative_arr.size

		return positive_arr if positive_arr.size > negative_arr.size

		negative_arr

	end

	def mode_val

		m_arr = []
		m_hash = {}

		@n_arr.each do |x|
			m_hash[x] ||= 0
			m_hash[x] += 1
		end

		high_key_value = m_hash[m_hash.keys.sort { |a, b| m_hash[b] <=> m_hash[a] }[0]]
		m_hash.keys.each { |key| m_arr.push(key) if m_hash[key] == high_key_value }
		m_arr.sort
	end

	def median_val

		if ((@n_arr.size % 2) == 1)
			@n_arr.sort[(@n_arr.size - 1)/2]
		else
			(@n_arr.sort[(@n_arr.size - 1)/2] + @n_arr.sort[(@n_arr.size + 1)/2])/2.0
		end
	end

	def mean_val
		@n_arr.inject(0, :+)/Float(@n_arr.size)
	end

	def averages_array(input_arr)

		@n_arr = input_arr

		return nil if @n_arr.size == 0

		[mode_val, median_val, mean_val, @n_arr.size]
	end

	def fibonacci(n)

		return nil if n <= 0

		return 0 if n == 1

		return 1 if n == 2

		fibonacci(n - 1) + fibonacci(n - 2)

	end
end