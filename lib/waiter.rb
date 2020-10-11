class Waiter

    @@all = []

    def self.all
        @@all
    end

    attr_reader :name, :years_experience

    def initialize(name, years)
        @name, @years_experience = name, years
        save
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end


    def meals
        Meal.all.select { |meal| meal.waiter == self}
    end

    #Will return the first customer with the largest tip if multiple customers have the same 
    # largest tip
    def best_tipper
        #find biggest tip
        biggest_tip = self.meals.map { |meal| meal.tip }.max
        # find customer associated with the biggest tip
        self.meals.find { |meal| meal.tip == biggest_tip }.customer
    end

    private

    def save
        self.class.all << self
    end

end