class TransactionsController < ApplicationController

    def new
    end

    def create
        @product = Product.find(params[:product_id])
        @transaction = Transaction.new
        @transaction.seller_id = @product.user_id
        @transaction.buyer_id = current_user.id
        @transaction.product_id = @product.id
        @transaction.save!
        @product.sold = true
        @product.save
        
        redirect_to products_url
    end 

    def my_products
        @products = Product.where user_id: current_user.id
    end

    def purchases
        @products = Product.joins(:transactions).where(transactions: { buyer_id: current_user.id })
    end

    def purchase
        @products = Product.joins(:transactions).where(transactions: { buyer_id: current_user.id })
    end
end
