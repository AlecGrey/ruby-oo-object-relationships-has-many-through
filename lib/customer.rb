require 'pry'
class Customer

    attr_reader :name, :age

    @@all = []

    # ~~ CLASS METHODS ~~ #

    def self.all
        @@all
    end

    # ~~ INSTANCE METHODS ~~ #

    def initialize(name, age)
        @name, @age = name, age
        self.save
    end

    def save
        @@all << self
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end

    def waiters
        self.meals.map {|meal| meal.waiter}.uniq
    end
end