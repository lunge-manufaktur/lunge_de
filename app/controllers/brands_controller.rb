class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create

  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.active.order(:name).includes(:products)
  end

  def search

  end

  # GET /brands/1
  def show
    @search = Product.published.where(brand_id: params[:id]).search(params[:q])
    @products = @search.result(distinct: true).includes(:brand, :product_images).page(params[:page]).per(20)
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render action: 'show', status: :created, location: @brand }
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end



  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(
      :id,
      :name,
      :logo
    )
  end
end
