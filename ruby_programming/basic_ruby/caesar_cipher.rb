def caesar_cipher(text, factor)
  solution = ""

  text.split("").each do |t|
    if t =~ /[a-z]/
      solution << (((t.ord - 'a'.ord) + factor) % 26 + 'a'.ord).chr
    elsif t =~ /[A-Z]/
      solution << (((t.ord - 'A'.ord) + factor) % 26 + 'A'.ord).chr
    else
      solution << t
    end
  end
  solution
end

text = "What a string!"

puts caesar_cipher(text, 5) #=> Bmfy f xywnsl!
