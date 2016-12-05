module Enumerable 
	def my_each
		for element in self
			yield(element)
		end

	end

	def my_each_with_index
		
		self.my_each {|element| yield(self.index(element))}

	end

	def my_select
		new_arr = Array.new()
		
		self.my_each { |element| new_arr.push(element) if yield(element)==true }

		new_arr
	end

	def my_all

		self.my_each { |element| return false unless yield(element) } 
		true

	end

	def my_any 
		self.my_each { |element| return true if yield(element) } 
		false
	end

	def my_none
		self.my_each { |element| return false if yield(element) }
		true
	end

	def my_count (*argument)
		total = 0

		if block_given?
			for element in self
				if yield(element)
					total+=1
				end

			end
			return total
		
		elsif !argument.empty?
			for element in self
				if argument == element
					total+=1
				end
			end
			return total
		else
			for element in self
				total += 1
			end
			return total
		end	

	end

	def my_map someProc=nil
		
		if someProc
			someProc.call(self)
		elsif block_given?
			new_arr = Array.new()

			for element in self
				new_arr.push(yield(element))
			end
			return new_arr

		else
			return self
		end
	end

	# inject starts
	def my_inject(*argument)
		if argument.empty?
			argument = 0

		else
			argument = argument[0]
		end

		result = 0
		total = 0
		for element in self
			
			result = yield argument, element
			argument = result
			
		
		end

		return result
		

	end
	# inject ends

	# method for testing inject method
	def multiply_els 
		self.my_inject(1) {|first,second| first * second}
	end


end

