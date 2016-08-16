class Api::StocksController < Api::ApplicationController
protect_from_forgery except: [:create, :update]
after_action :verify_authorized
respond_to :json

# GET /api/stocks
def index
  @stocks = Stock.all
  authorize @stocks
end

# GET /api/stocks/1
def show
  @stock = Stock.find(params[:id])
  authorize @stock
end

# POST /api/stocks
def create
  @stock = Stock.new(stock_params)
  authorize @stock
  if @stock.save
    render json: @stock, status: :created
  else
    render json: @stock.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /api/stocks/1
def update
  @stock = Stock.find(params[:id])
  authorize @stock
  if @stock.update(stock_params)
    render json: @stock
  else
    render json: @stock.errors, status: :unprocessable_entity
  end
end

# DELETE /api/stocks/1
def destroy
  @stock = Stock.find(params[:id])
  authorize @stock

  if @stock.destroy
    head :no_content
  else
    render json: @stock.errors, status: :unprocessable_entity
  end
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
