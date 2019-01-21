#Gets an array of days as index and prices as values and picks up
#the best buy/sell days by price difference.
def stock_picker(for_stock_prices)
  #initialization of variables
  buy_day = nil
  sell_day = nil
  best_profit = 0
  last_day = for_stock_prices.size - 1

  #Scan potential buy days
  for_stock_prices.each_with_index do |price1,day1|
  #Scan potential sell days (must be after buy day)
   for_stock_prices[day1+1..last_day].each_with_index do |price2,day_shift|
      #Check if found better profit and keep these days
      if (price2 - price1) > best_profit
        best_profit = price2 - price1
        buy_day = day1
        sell_day = day1 + day_shift + 1
      end
    end
  end

  #return best sell/buy days
  return [buy_day,sell_day]
end
