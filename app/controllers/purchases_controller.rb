class PurchasesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show]
    def index
        #Selects all products where the current user is a buyer
        @products = Product.joins(:transactions).where(transactions: { buyer_id: current_user.id })
    end

    def show
        #Set product through params to a variable
        @product = Product.find(params[:id])
    end
end
