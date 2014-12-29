def stock_picker(arr)
	max = 0
	location = []
	value = []
	arr.length.times do |i|
		arr.length.times do |j|
			if(j > i)
				profit = arr[j] - arr[i]
				if(profit > max)
					max = profit
					location = [i+1,j+1]
					value = [arr[i], arr[j]]
				end
			end
		end
	end
	puts("Two days are:")
	print(location)
	puts("\nTwo values are:")
	print(value)
	puts "\nThe profit is:"
	print("$#{max}")
end

arr = [1,2,3,54,300,6]
puts(stock_picker(arr))