def stock_picker prices
  solution = []
  diff = 0

  prices.each do |min|
    unless (min == prices.max) && ((min == prices.first) || (min == prices.last))
      sub_prices = prices[(prices.index(min)+1)..-1]
      sub_prices.each do |max|
        if max - min > diff
          diff = max - min
          solution = [prices.index(min), prices.index(max)]
        end
      end
    end
  end
  solution
end

a = [17,3,6,9,15,8,6,1,10]

puts stock_picker a
