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
        # initializing a new meal for self, w/waiter, total & tip
        Meal.new(waiter, self, total, tip) #=> new meal obj
    end

    def meals
        # returns array of meals ordered by this customer
        Meal.all.select {|meal_obj| self == meal_obj.customer}
    end

    def waiters
        # all waiter_obj associated with customer_obj through meal_obj
        self.meals.map {|meal_obj| meal_obj.waiter}.uniq
    end
end