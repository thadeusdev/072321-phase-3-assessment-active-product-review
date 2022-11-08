class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        favorite_product_id = Review.find_by(star_rating: reviews.maximum(:star_rating)).product_id
        Product.find(favorite_product_id)
    end

    def remove_reviews(product)
        reviews.where(product_id: product.id).destroy_all
    end
end

# User.first.products
# => [#<Product:0x000055f66fc59de0 id: 3, name: "Dry Erase Markers", price: 5>,
#  #<Product:0x000055f66fc61e28 id: 5, name: "Scotch Tape", price: 3>,
#  #<Product:0x000055f66fc61d60 id: 5, name: "Scotch Tape", price: 3>,
#  #<Product:0x000055f66fc61c98 id: 2, name: "Whiteboard", price: 15>,
#  #<Product:0x000055f66fc61bd0 id: 1, name: "Stapler", price: 10>]