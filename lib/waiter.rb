require 'pry'


class Waiter
    attr_accessor :name, :experience

    @@all = []

    def initialize(name, experience)
        @name = name
        @experience = experience
        self.class.all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        meals.reduce{|best_meal, meal| best_meal.tip >= meal.tip ? best_meal : meal}.customer
    end


    

    def self.all
        @@all
    end

end