class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

    def index
      @products = Product.where sold: nil
      if current_user
      @user_id = current_user.id
      end
    end
   
    def show
      @product = Product.find(params[:id])
      @user = User.find_by(id: @product.user_id).username
      @user_id = current_user.id
    end
   
    def new
      @product = Product.new
    end
   
    def edit
      @product = Product.find(params[:id])
    end
   
    def create
      @product = Product.new(product_params)
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
      @product = Product.find(params[:id])
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