class PurchasesController < ApplicationController
    def index
        @products = Product.joins(:transactions).where(transactions: { buyer_id: current_user.id })
    end

    def show
        @product = Product.find(params[:id])
    end
end
