module Api
	class EventsController < ApplicationController
		respond_to :json
		protect_from_forgery except: [:create, :update]

		# GET /api/events/
		def index
			respond_with Event.all
		end

		# GET /api/events/1
		def show
			respond_with Event.find(params[:id])
		end

		# POST /api/events/
		def create
			respond_with Event.create(event_params)
		end

		# PATCH /api/events/1
		def update
			respond_with Event.update(params[:id], event_params)
		end



		private
		def event_params
			params.require(:event).permit(
				:id,
				:employee_id,
				:store_id,
				:starts_at,
				:ends_at,
				:pause,
				:vacation,
				:sick,
				:comment
			)
		end

	end
end