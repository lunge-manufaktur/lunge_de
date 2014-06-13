module Admin
	class EventsController < ApplicationController

		def index
			@events = Event.all
		end

		def show
			@event = Event.find(params[:id])
		end

		def new
			@event = Event.new
		end

		def create
			@event = Event.new(event_params)

			respond_to do |format|
			  if @event.save
			    format.html { redirect_to events_path, notice: 'Event was successfully created.' }
			    format.json { render action: 'show', status: :created, location: @post }
			  else
			    format.html { render action: 'new' }
			    format.json { render json: @events.errors, status: :unprocessable_entity }
			  end
			end
		end



		private
		def event_params
			params.require(:event).permit(
				:id,
				:user_id,
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