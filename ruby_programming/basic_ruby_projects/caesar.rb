puts "This is a program for ciphering messages using the Caesar cipher."

#get the message from the user, store it as an array of words

puts "Enter your message:"
words = gets.chomp.split(" ")

#get the shift from the user, store it as an integer

puts "Enter a shift factor between 1 and 25:"

shift = gets.chomp.to_i

#check if the factor is valid

while shift > 25 || shift <= 0 do
    puts "Invalid factor, enter a factor between 1 and 25:"
    shift = gets.chomp.to_i
end

#create an empty array to store the output cipher

cipher = []

#iterate through each word of the message

words.each do |word|
    
    #create an array to store the ciphered word
    
    cip = []
    
    #iterate through each character of the word
    
    word.each_char do |c|
        
        case c
            
        when c.downcase
            
            #push the shifted character into the ciphered word array (if no wrapping is required)
            
            if c.ord + shift <= 122
                
                cip << (c.ord + shift).chr
                
            
                
            #push the shifted character into the ciphered word array (if wrapping is required)

            else
                cip << (c.ord + shift - 26).chr
            end
            
        when c.upcase
            
            if c.ord + shift <= 90
                
                cip << (c.ord + shift).chr
                
            else
                cip << (c.ord + shift - 26).chr
            end
        end
    end
    
    #after iterating through each character, push the ciphered word into the output cipher array
    
    cipher << cip.join
end

#print the cipher to the console

puts cipher.join(" ")
