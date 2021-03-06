class Product < ApplicationRecord
    validates :name, presence: true
    
    has_many :orders
    has_many :comments
    def self.search(search_term)
        if Rails.env.production?
            Product.where("name ilike ?", "%#{search_term}%")
        else
            Product.where("name LIKE ?", "%#{search_term}%")
        end
    end
    def highest_rating
        comments.rating_desc.first
    end
    def lowest_rating
        comments.rating_desc.last
    end
    def average_rating
        comments.average(:rating).to_f
    end
    
    def comments_count
        comments.count
    end

    
end
