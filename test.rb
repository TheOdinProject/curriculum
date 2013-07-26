

class Viking

  def initialize(name, health, age, strength)
    @age = age
    @name = name
    @health = health
    @strength = strength
  end

  def self.create_child(name)
    age = (rand * 18)   # remember, rand gives a random 0 to 1
    health = age * 5
    strength = age / 2
    Viking.new(name, health, age, strength)  # returned
  end
end

oleg = Viking.new("Oleg", 19, 100, 8)
olga = Viking.create_child("olga")
puts "WOOO"