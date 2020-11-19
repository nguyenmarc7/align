class TransactionsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

    def new
    end

    def create
        #Set product through params to a variable
        @product = Product.find(params[:product_id])
        #Assigning values to transaction
        @transaction = Transaction.new
        @transaction.seller_id = @product.user_id
        @transaction.buyer_id = current_user.id
        @transaction.product_id = @product.id
        @transaction.save
        @product.sold = true
        @product.save
        
        redirect_to products_url
    end 
end
