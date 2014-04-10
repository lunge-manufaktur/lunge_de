class ProductCategoriesController < ApplicationController

	def index
		@product_categories = ProductCategory.all
	end

	def new
		@product_category = ProductCategory.new
	end

	def create
		@product_category = ProductCategory.new(product_category_params)

		if @product_category.save
			redirect_to @product_category, notice: "Produktgruppe wurde erfolgreich erstellt"
		else
			render action "new"
		end
	end

	def show
		@product_category = ProductCategory.find(params[:id])
	end



	private

	def product_category_params
		params.require(:product_category).permit(
			:id,
			:name,
			:parent_id,
			:lft,
			:right,
			:depth
		)
	end

end