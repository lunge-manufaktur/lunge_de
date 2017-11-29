module Api
  class PropertiesController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_action :restrict_access
    respond_to :json

    # GET /stocks
    def index
      respond_with Property.all
    end

    # GET /stocks/1
    def show
      respond_with Property.find(params[:id])
    end

    # POST /stocks
    def create
      respond_with Property.create(property_params)
    end

    # PATCH/PUT /stocks/1
    def update
      respond_with Property.update(params[:id], property_params)
    end

    # DELETE /stocks/1
    def destroy
      respond_with Property.destroy(params[:id])
      head :no_content
    end



    private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
      end
    end

    def property_params
      params.require(:property).permit(
        :id,
        :product_id,
        :name,
        :value
      )
    end

  end
end
