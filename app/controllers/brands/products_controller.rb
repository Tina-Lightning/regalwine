class Brands::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_user_admin, only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json

  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @brand = Brand.find(params[:brand_id])
    @product = Product.new(product_params)
    @product.brand = @brand
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @brand, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product was updated successfully."
      redirect_to @brand
    else
      flash[:error] = "There was an error updating the product."
      render :show
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:id])
    title = @product.name

    if @product.destroy 
      flash[:notice] = "#{title} was deleted successfully."
      redirect_to @brand
    else
      flash[:error] = "There was an error deleting the product."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :product_type, :product_subtype, :vintage, :country, :region, :description, :brand_id, :user_id, :image, :remote_image_url)
    end

    def require_user_admin
      if !current_user.admin?
        flash[:danger] = "Only admins can only edit brands and products"
        redirect_to brands_path
      end
    end
end
