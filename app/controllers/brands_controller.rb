class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy], unless: :valid_api_key?
  protect_from_forgery except: :create

  def index
    @brands = Brand.active.order(:name).includes(products: :product_images)
  end

  def search

  end

  def show
    @search = Product.published.where(brand_id: @brand.id).search(params[:q])
    @products = @search.result(distinct: true).includes(:brand, :product_images).page(params[:page]).per(20)
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

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

  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end



  private

  def set_brand
    @brand = Brand.friendly.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(
      :id,
      :name,
      :logo
    )
  end
end
