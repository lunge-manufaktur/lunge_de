module Api
	class ProductCategoriesController
		respond_to :json

		# GET /product_categories
		def index
			respond_with ProductCategory.all
		end

		# GET /product_categories/1
		def show
			respond_with ProductCategory.find(params[:id])
		end

		# POST /product_categories
		def create
			respond_with ProductCategory.create(product_category_params)
		end

		# PATCH/PUT /product_categories/1
		def update
			respond_with ProductCategory.update(params[:id], product_category_params)
		end

		# DELETE /product_categories/1
		def destroy
			respond_with ProductCategory.destroy(params[:id])
		end



		private

		def product_category_params
			params.require(:product_category).permit(
				:id,
				:name,
				:parent_id,
				:lft,
				:rgt,
				:depth
			)
		end

	end
end