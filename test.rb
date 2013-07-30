

class Viking
  attr_accessor :name, :health, :age, :strength, :dead

  def initialize(name, health, age, strength)
    @age = age
    @name = name
    @health = health
    @strength = strength
    @dead = false
  end

  def self.create_warrior(name)
      age = rand * 20 + 15   # remember, rand gives a random 0 to 1
      health = [age * 5, 120].min
      strength = [age / 2, 10].min
      Viking.new(name, health, age, strength)  # returned
  end

        def attack(recipient)
            if recipient.dead
                puts "#{recipient.name} is already dead!"
                return false
            end
            damage = (rand * 10 + 10).round(0)
            recipient.take_damage(damage)  # `take_damage` called on `recipient`!
        end
        protected
            def take_damage(damage)
                self.health -= damage
                puts "Ouch! #{self.name} took #{damage} damage and has #{self.health} health left"
                die if @health <= 0  # `die` called on the same object as take_damage was (the `recipient` as well!)
            end
        private
            def die
                puts "#{self.name} has been killed :("
                self.dead = true  # assume we've defined a `dead` instance variable
            end
end

# oleg = Viking.new("Oleg", 19, 100, 8)
puts "WOOO"