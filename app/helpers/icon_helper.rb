module IconHelper

	def toolbar_icon(name, icon, color=nil)
		color_attribute = "style='color: #{color}'" unless color.nil?
		( "<span class='#{icon} ion-big' #{color_attribute}></span><br>#{name}" ).html_safe
	end

	def inline_icon(name, icon, color=nil)
		color_attribute = "style='color: #{color}'" unless color.nil?
		( "<i class = '#{icon}' #{color_attribute}></i> #{name}" ).html_safe
	end

end