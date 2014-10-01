module Api
  class StocksController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_filter :restrict_access
    respond_to :json

    # GET /api/stocks
    def index
      respond_with @stocks = Stock.all
    end

    # GET /api/stocks/1
    def show
      respond_with @stock = Stock.find(params[:id])
    end

    # POST /api/stocks
    def create
      respond_with @stock = Stock.create(stock_params)
    end

    # PATCH/PUT /api/stocks/1
    def update
      respond_with @stock = Stock.update(params[:id], stock_params)
    end

    # DELETE /api/stocks/1
    def destroy
      respond_with @stock = Stock.destroy(params[:id])
      head :no_content
    end



    private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
      end
    end

    def stock_params
      params.require(:stock).permit(
        :id,
        :product_id,
        :store_id,
        :g1,
        :g1h,
        :g2,
        :g2h,
        :g3,
        :g3h,
        :g4,
        :g4h,
        :g5,
        :g5h,
        :g6,
        :g6h,
        :g7,
        :g7h,
        :g8,
        :g8h,
        :g9,
        :g9h,
        :g10,
        :g10h,
        :g11,
        :g11h,
        :g12,
        :g12h,
        :g13,
        :g13h,
        :g14,
        :g14h,
        :g15,
        :g16,
        :g17,
        :g18,
        :g19
      )
    end

  end
end
