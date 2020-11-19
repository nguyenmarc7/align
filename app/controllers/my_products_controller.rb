class MyProductsController < ApplicationController
    def index
        #Selects all products where product.user_id = current_user.id and sold is nil
        @products = Product.where user_id: current_user.id, sold: nil
    end
end
