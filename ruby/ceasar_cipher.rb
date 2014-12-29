def ceasar_cipher_encrypt(str, key)
	value = ''
	if key.to_i > 26
		key = key.to_i % 26
	end
	str.split('').each do |element|
		value = value + 
		((element.ord + key.to_i > 122) ? (element.ord + key.to_i - 26).chr : (element.ord + key.to_i).chr)
	end
	return value
end

def ceasar_cipher_decrypt(bool, str, key)
	value = ''
	if bool == 'y'
		if key.to_i > 26
			key = key.to_i % 26
		end
		str.split('').each do |element|
			value = value + 
			((element.ord - key.to_i < 96) ? (element.ord - key.to_i + 26).chr : (element.ord - key.to_i).chr)
		end
		return value
	end
	puts('Goodbye!')
end

puts('Enter you string:(in downcase)')
str = gets.chomp
puts('Enter you key:')
key = gets.chomp
puts(ceasar_cipher_encrypt(str,key))
puts('Do you want to decrypt you cipher [y/n]')
bool = gets.chomp
puts(ceasar_cipher_decrypt(bool, ceasar_cipher_encrypt(str,key), key))