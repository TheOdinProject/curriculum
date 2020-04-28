#welcome to rub

def caesar_cipher(str,num)
  str_arr = str.split('')
  for a in str_arr
    if a.ord < 65 || a.ord > 122
           next
       else
           a = a.ord > 65 && a.ord < 97 ?
           ((a.ord - 65 + num)%26 +65).chr :
           ((a.ord - 97 + num)%26 +97).chr
  str_arr.join()
  end

puts caesar_cipher('UO',2)
