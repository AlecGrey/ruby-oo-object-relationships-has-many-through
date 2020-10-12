class Waiter

    attr_reader :name, :experience

    @@all = []

    # ~~ CLASS METHODS ~~ #

    def self.all
        @@all
    end

    # ~~ INSTANCE METHODS ~~ #

    def initialize(name, experience)
        @name, @experience = name, experience
        self.save
    end

    def save
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal_obj| self == meal_obj.waiter}
    end

    def best_tipper
        self.meals.reduce do |accumulator, current|
            current.tip > accumulator.tip ? current : accumulator
        end.customer
    end

end