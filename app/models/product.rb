class Product < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_one_attached :picture

    validates :name, presence: true, length: { in: 1..20 }
    validates :description, presence: true

    
    
end
