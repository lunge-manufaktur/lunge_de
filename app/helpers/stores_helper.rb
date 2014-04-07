module StoresHelper

	def route_overview(test)

		@steps = []

		test["legs"].first["steps"].each do |step|

			mode = step["travel_mode"]

			if mode == "WALKING"
				type = mode
				line = "Laufen"
			else
				type = step["transit_details"]["line"]["vehicle"]["type"]
				line = step["transit_details"]["line"]["short_name"]
			end
			
			step_hash = { "mode" => mode, "type" => type, "line" => line }

			@steps.push(step_hash)

		end
	end

end