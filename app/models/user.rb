class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def remove_reviews(product)
        reviews = self.reviews.where(product_id: product.id)
        reviews.destroy_all
    end

    def favorite_product
        favorite = self.reviews.sort(star_rating).first
        favorite.product.name
    end

end