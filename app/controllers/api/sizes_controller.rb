module Api
  class SizesController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_action :current_user
    after_action :verify_authorized
    respond_to :json

    # GET /sizes
    def index
      @sizes = Size.all
      authorize @sizes
    end

    # GET /sizes/1
    def show
      @size = Size.find(params[:id])
      authorize @size
    end

    # POST /sizes
    def create
      @size = Size.new(size_params)
      authorize @size
      if @size.save
        render nothing: true, status: 201
      end
    end

    # PATCH/PUT /sizes/1
    def update
      @size = Size.find(params[:id])
      authorize @size
      respond_with @size.update(size_params)
    end

    # DELETE /sizes/1
    def destroy
      @size = Size.find(params[:id])
      authorize @size
      respond_with @size.destroy
    end



    private

    def current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by_key(token)
        user = key.user if key
      end
    end

    def size_params
      params.require(:size).permit(
        :id,
        :name,
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
