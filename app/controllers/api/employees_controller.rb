module Api
	class EmployeesController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/employees/
		def index
			respond_with Employee.all
		end

		# GET /api/employees/1
		def index
			respond_with Employee.find(params[:id])
		end

		# POST /api/employees/
		def create
			respond_with Employee.create(employee_params)
		end

		# PATCH /api/employees/1
		def update
			respond_with Employee.update(params[:id], employee_params)
		end



		private
		def employee_params
			params.require(:employee).permit(
				:id,
				:name,
				:user_id
			)
		end

	end
end