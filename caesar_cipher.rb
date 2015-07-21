# Takes a string and shifts each character to the left a given number of times

def caesar_cipher(string, shift_number)
  # Defined an upper and lowercase alphabet to maintain given case, hope to optimize later
	alphabet_downcase = ('a'..'z').to_a
	alphabet_upcase = ('A'..'Z').to_a
	deciphered_message = ''
	string.each_char do |i|
		if alphabet_downcase.include?(i)
		  deciphered_message += alphabet_downcase[alphabet_downcase.index(i) - shift_number]
		elsif alphabet_upcase.include?(i)
		  deciphered_message += alphabet_upcase[alphabet_upcase.index(i) - shift_number]
		else
		  # Allows spaces and punctuation to be added
		  deciphered_message += i
		end
	end
	return deciphered_message
end
p caesar_cipher("Hello World!", 5)
