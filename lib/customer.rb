require_relative 'meal'
class Customer
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age

        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
        # binding.pry
        meal
    end

    def meals
        Meal.all.select {|m| m.customer == self}
    end

    def waiters
        meals.map {|m| m.waiter }.uniq
    end
end