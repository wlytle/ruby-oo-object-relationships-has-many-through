require 'pry'
class Customer

    @@all = []

    def self.all
        @@all
    end

    attr_reader :name, :age

    def initialize(name, age)
        @name, @age = name, age 
        save           
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.customer == self}
    end

    def waiters
        self.meals.map { |meal| meal.waiter }
    end

    private

    def save
        self.class.all << self
    end

end