class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

    def index
      #Selects * products where product.sold is nil
      @products = Product.where sold: nil
      if current_user
      #Set current_user.id to a variable
      @user_id = current_user.id
      end
    end
   
    def show
      #Set product through params to a variable
      @product = Product.find(params[:id])
      #Finds username associated with product of concern
      @user = User.find_by(id: @product.user_id).username
      if current_user
      #Set current_user.id to a variable
      @user_id = current_user.id
      end
    end
   
    def new
      #Initialises a product instance
      @product = Product.new
    end
   
    def edit
      #Set product through params to a variable
      @product = Product.find(params[:id])
    end
   
    def create
      #Set product through params to a variable
      @product = Product.new(product_params)
       #Set product.user_id to current_user.id
      @product[:user_id] = current_user.id
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, statuspr: :unprocessable_entity }
        end
      end
    end
   
    def update
      #Set product through params to a variable
      @product = Product.find(params[:id])

      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
   
    def destroy
      #Set product through params to a variable
      @product = Product.find(params[:id])
      #Delete selected product
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
   
    private
      def product_params
        params.require(:product).permit(:name, :description, :picture)
      end
  end