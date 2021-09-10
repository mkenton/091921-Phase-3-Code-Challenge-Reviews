class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def prints_review
        if self
            puts "Review for #{product.name} by #{user.name}: #{self.star_rating}. #{self.comment}"
        else
            puts "no reviews" 
        end
    end
end