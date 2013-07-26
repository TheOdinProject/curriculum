

class Viking

  def initialize(name, health, age, strength)
    @age = age
    @name = name
    @health = health
    @strength = strength
  end

        def self.create_warrior(name)
            age = rand * 20 + 15   # remember, rand gives a random 0 to 1
            health = [age * 5, 120].min
            strength = [age / 2, 10].min
            Viking.new(name, health, age, strength)  # returned
        end
end

oleg = Viking.new("Oleg", 19, 100, 8)
olga = Viking.create_child("olga")
puts "WOOO"