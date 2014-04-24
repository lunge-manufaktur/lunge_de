module Api
  class SizesController < ApplicationController
    protect_from_forgery except: [:create, :update]
    before_filter :restrict_access
    respond_to :json

    # GET /sizes
    def index
      respond_with Size.all
    end

    # GET /sizes/1
    def show
      respond_with Size.find(params[:id])
    end

    # POST /sizes
    def create
      respond_with Size.create(size_params)
    end

    # PATCH/PUT /sizes/1
    def update
      respond_with Size.update(params[:id], size_params)
    end

    # DELETE /sizes/1
    def destroy
      respond_with Size.destroy(params[:id])
    end



    private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(key: token)
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
