class Meal

    attr_reader :waiter, :customer, :total, :tip

    @@all

    # ~~ CLASS METHODS ~~ #

    def self.all
        @@all
    end

    # ~~ INSTANCE METHODS ~~ #

    def initialize(waiter, customer, total, tip)
        @waiter, @customer, @total, @tip = waiter, customer, total, tip
        self.save
    end

    def save
        @@all << self
    end

end