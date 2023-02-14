class Show < ActiveRecord::Base

    def self.highest_rating 
        self.maximum(:rating)
        # maximum(:rating) -- works without self 
    end

    def self.most_popular_show
        # self.where("rating > ?", self.highest_rating).first -- or .last since returns an array
        self.find_by(rating: highest_rating) 
        # self.find_by(rating: self.maximum(:rating))  -- works also
    end

    def self.lowest_rating 
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.find_by(rating: lowest_rating) 
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows 
        self.where("rating > ?", 5)
    end

    def self.shows_by_alphabetical_order
        self.order(:name)
    end

end