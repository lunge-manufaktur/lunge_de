module Api
  class StoresController < ApplicationController
    protect_from_forgery except: [:create, :update]
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
        render json: @store, status: :created
      else
        render json: @store.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /stores/1
    def update
      @store = Store.find(params[:id])
      authorize @store
      if @store.update(store_params)
        render json: @store
      else
        render json: @store.errors, status: :unprocessable_entity
      end
    end

    # DELETE /stores/1
    def destroy
      @store = Store.find(params[:id])
      authorize @store
      if @store.destroy
        head :no_content
      else
        render json: @store.errors, status: :unprocessable_entity
      end
    end

    private

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
