class ApiKeysController < ApplicationController
	def create
		@api_key = ApiKey.new(api_key_params)

		if @api_key.save
			redirect_to edit_user_registration_path(current_user), notice: 'Api Key was successfully created.'
		else
			redirect_to edit_user_registration_path, alert: 'Erstellen fehlgeschlagen.'
		end
	end



	private

	def api_key_params
	  params.require(:api_key).permit(
	    :id,
	    :user_id,
	    :key
	  )
	end
end