class MyProductsController < ApplicationController
    def index
        @products = Product.where user_id: current_user.id, sold: nil
    end
end
