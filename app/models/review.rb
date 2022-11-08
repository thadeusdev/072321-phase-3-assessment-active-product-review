class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def print_review
        puts "Review for #{self.product.name} by #{self.user.name}: #{self.star_rating}. #{self.comment}"
    end
end

# Review.first.user
# # => #<User:0x000055f66fccb9e0 id: 1, name: "Reyes Cruickshank">