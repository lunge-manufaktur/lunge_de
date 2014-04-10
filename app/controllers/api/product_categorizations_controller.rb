module Api
	class ProductCategorizationsController < ApplicationController
		respond_to :json

		# GET /product_categorizations
		def index
			respond_with ProductCategorization.all
		end

		# GET /product_categorizations/1
		def show
			respond_with ProductCategorization.find(params[:id])
		end

		# POST /product_categorizations
		def create
			respond_with ProductCategorization.create(product_categorization_params)
		end

		# PATCH/PUT /product_categorizations/1
		def update
			respond_with ProductCategorization.update(params[:id], product_categorization_params)
		end

		# DELETE /product_categorization/1
		def destroy
			respond_with ProductCategorization.find(params[:id])
		end



		private

		def product_categorization_params
			params.require(:product_categorization).permit(
				:id,
				:product_id,
				:product_category_id
			)
		end

	end
end