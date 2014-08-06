module ProductsHelper

	def tag_to_remove(tag_name)
		link 	=	if @tags.size > 1
							@tags.reject{ |i| i == tag_name }.join("+")
						else
							products_path
						end

		link_to(
			(
				content_tag(:span, tag_name.upcase).concat(
				content_tag(:span, "", class: "ion-close suffix"))
			),
			link,
			class: "label tag-to-remove"
		)
	end



	def tag_to_add(tag_name)
		link = "#{@tags.join("+")}+#{tag_name}"

		link_to(
			(
				content_tag(:span, tag_name.upcase).concat(
				content_tag(:span, "", class: "ion-plus suffix"))
			),
			link,
			class: "label tag-to-add"
		)
	end



	def first_tag_to_add(tag_name)
		link = tag_products_path(tag_name)

		link_to(
			(
				content_tag(:span, tag_name.upcase).concat(
				content_tag(:span, "", class: "ion-plus suffix"))
			),
			link,
			class: "label tag-to-add"
		)
	end



	def tag_cloud_item(tag_name)
		if @tags
			if @tags.include?(tag_name)
				tag_to_remove(tag_name)
			else
				tag_to_add(tag_name)
			end
		else
			first_tag_to_add(tag_name)
		end
	end

end