module Api
  class StoresController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_action :current_user
    after_action :verify_authorized
    respond_to :json

    # GET /stores
    def index
      @stores = Store.all
      authorize @stores
    end

    # GET /stores/1
    def show
      @store = Store.find(params[:id])
      authorize @store
    end

    # POST /stores
    def create
      @store = Store.new(store_params)
      authorize @store
      if @store.save
        render nothing: true, status: :created
      end
    end

    # PATCH/PUT /stores/1
    def update
      @store = Store.find(params[:id])
      authorize @store
      respond_with @store.update(store_params)
    end

    # DELETE /stores/1
    def destroy
      @store = Store.find(params[:id])
      authorize @store
      respond_with @store.destroy
    end

    private

    def current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by_key(token)
        user = key.user if key
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(
        :id,
        :name,
        :address_name,
        :street,
        :zip,
        :city,
        :phone,
        :email,
        :active,
        :latitude,
        :longitude,
        :description
      )
    end
  end
end
