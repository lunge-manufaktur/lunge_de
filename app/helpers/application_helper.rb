module ApplicationHelper
	def boolean_icon(boolean)
		if boolean == true
			content_tag :span, "", class: "ion-ios7-checkmark-empty"
		else
			content_tag :span, "", class: "ion-ios7-close-empty"
		end
	end
end
