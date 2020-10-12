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
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        self.meals.max_by {|meal| meal.tip}.customer
    end

    def customers
        self.meals.map {|meal| meal.customers}.uniq
    end

end