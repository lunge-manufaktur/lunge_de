module Api
  class StoresController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_filter :restrict_access
    respond_to :json

    # GET /stores
    def index
      respond_with Store.all
    end

    # GET /stores/1
    def show
      respond_with Store.find(params[:id])
    end

    # POST /stores
    def create
      respond_with Store.create(store_params)
    end

    # PATCH/PUT /stores/1
    def update
      respond_with Store.update(params[:id], store_params)
    end

    # DELETE /stores/1
    def destroy
      respond_with Store.destroy(params[:id])
      head :no_content
    end

    private
    
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
      end
    end
    
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(
        :id,
        :name,
        :description,
        :address_name,
        :street,
        :zip,
        :city,
        :phone,
        :email,
        :active,
        :latitude,
        :longitude
      )
    end
  end
end
