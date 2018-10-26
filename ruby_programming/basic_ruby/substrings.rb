DICTIONARY = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (text, dictionary)
  solution = {}

  dictionary.each do |word|
    coincidence = text.downcase.scan(word).count
    solution[word] = coincidence if coincidence > 0
  end

  solution
end

text = "Howdy partner, sit down! How's it going?"
puts substrings(text, DICTIONARY)
#=> { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
