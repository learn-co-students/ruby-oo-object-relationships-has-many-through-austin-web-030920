require 'pry'

class Waiter
    @@all = []
    def initialize(name, years)
        @name = name
        @years = years

        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals 
        Meal.all.select {|m| m.waiter == self }
    end

    def best_tipper
        Meal.all.sort_by { |meal| meal.tip }.last.customer
    end
end