module Api
  class BrandsController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_action :current_user
    after_action :verify_authorized
    respond_to :json

    # GET /brands
    def index
      @brands = Brand.order(:name)
      authorize @brands
    end

    # GET /brands/1
    def show
      @brand = Brand.find(params[:id])
      authorize @brand
    end

    # POST /brands
    def create
      @brand = Brand.create(brand_params)
      authorize @brand
      if @brand.save
        render json: @brand, status: :created
      else
        render json: @brand.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /brands/1
    def update
      @brand = Brand.find(params[:id])
      authorize @brand
      if @brand.update(brand_params)
        render json: @brand
      else
        render json: @brand.errors, status: :unprocessable_entity
      end
    end

    # DELETE /brands/1
    def destroy
      @brand = Brand.find(params[:id])
      authorize @brand
      respond_with @brand.destroy
    end



    private

    def current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by_key(token)
        user = key.user if key
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(
        :id,
        :name
      )
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
      end
    end

  end
end
