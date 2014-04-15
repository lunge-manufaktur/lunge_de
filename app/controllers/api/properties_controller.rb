module Api
  class PropertiesController < ApplicationController
    protect_from_forgery except: [:create, :update]
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

      # Never trust parameters from the scary internet, only allow the white list through.
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
