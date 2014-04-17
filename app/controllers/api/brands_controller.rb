module Api
  class BrandsController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_filter :restrict_access
    respond_to :json

    # GET /brands
    def index
      respond_with Brand.all
    end

    # GET /brands/1
    def show
      respond_with Brand.find(params[:id])
    end

    # POST /brands
    def create
      respond_with Brand.create(brand_params)
    end

    # PATCH/PUT /brands/1
    def update
      respond_with Brand.update(params[:id], brand_params)
    end

    # DELETE /brands/1
    def destroy
      respond_with Brand.destroy(params[:id])
      head :no_content
    end



    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(
        :id,
        :name,
        :logo
      )
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
      end
    end

  end
end
