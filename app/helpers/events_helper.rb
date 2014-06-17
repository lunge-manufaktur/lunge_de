module EventsHelper
	
	def calendar_title
		->(start_date) { content_tag :span, "#{I18n.t("date.month_names")[start_date.month]} #{start_date.year}", class: "calendar-title" }
	end

	def calendar_previous
		->(param, date_range) { link_to toolbar_icon("", "ion-ios7-arrow-left"), {param => date_range.first - 1.day} }
	end

	def calendar_next
		->(param, date_range) { link_to toolbar_icon("", "ion-ios7-arrow-right"), {param => date_range.last + 1.day} }
	end

	def calendar_full_title
		content_tag :h2, "#{calendar_previous} #{calendar_title} #{calendar_next}"
	end

end