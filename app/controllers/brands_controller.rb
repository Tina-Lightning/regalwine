class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :require_user_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search, :tech_sheet]
  #before_action :admin_user, only: [:edit, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def search
    if params[:search].present?
      @brands = Brand.search(params[:search])
    else
      @brands = Brand.all
    end
  end

  def index
    @brands = Brand.order('name ASC').paginate(:page => params[:page], :per_page => 30)
    @alpha = @brands.group_by{|u| u.name[0]}
    
    respond_to do |format|
      format.html
      format.csv { render text: @brands.to_csv }
    end
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.friendly.find(params[:id])
    if request.path != brand_path(@brand)
      redirect_to @brand, status: :moved_permanently
    end
    @products = @brand.products
  end

  # GET /brands/new
  def new
    @brand = current_user.brands.build
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = current_user.brands.build(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    if params[:file].present?
      Brand.import(params[:file], current_user.id)
      redirect_to brands_path, notice: "Brands added successfully"
    else
      redirect_to :back, notice: "You need to choose a file first!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(:name, :description, :viticulture, :image, :remote_image_url, :website, :country, :region, :appellation, :varietal, :soil_type, :enologist, :viticulturist, :vineyard_size, :total_production)
    end

    # looks up the brand through the user, and if the brand doesn't belong to that user, it won't exist, 
    # and it will redirect to the brands_path
    def correct_user
      @brand = current_user.brands.find_by(id: params[:id])
      redirect_to brands_path, notice: "Not authorized to edit this brand" if @brand.nil?
    end

    #def admin_user
    #  redirect_to brands_path unless current_user.admin?
    #end

    def require_user_admin
      if !current_user.admin?
        flash[:danger] = "Only admins can only edit brands and products"
        redirect_to brands_path
      end
    end
end
