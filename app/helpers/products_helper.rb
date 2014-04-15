module ProductsHelper

	def tag_to_remove(tag_name)
		link 	=	if @tags.size > 1
							tag_products_path(@tags.reject{ |i| i == tag_name})
						else
							products_path
						end

		
		content_tag(:span, tag_name.upcase,	class: "label").concat(
		link_to inline_icon("", "ion-close"), link, class: "label tag-to-remove suffix")
	end



	def tag_to_add(tag_name)
		link = "#{tag_products_path(@tags)+'/'+tag_name}"

		content_tag(:span, tag_name.upcase,	class: "label tag-to-add").concat(
		link_to inline_icon("", "ion-plus"), link, class: "label tag-to-add suffix")
	end



	def first_tag_to_add(tag_name)
		link = tag_products_path(tag_name)

		content_tag(:span, tag_name.upcase,	class: "label").concat(
		link_to inline_icon("", "ion-plus"), link, class: "label suffix")
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



# <% if @tags.include?(tag.name) %>
# 	<span class="label alert"><%= tag.name.upcase %></span>							
# 	<%= link_to inline_icon("", "ion-ios7-close-empty"),
# 	  (if @tags.size > 1
# 	    tag_products_path(@tags.reject{ |i| i == tag.name})
# 	  else
# 	    products_path
# 	  end),
# 	  class: "label alert remove-tag"
# 	%>
# <% else %>
# 	<%= link_to link_to inline_icon(tag.name.upcase.to_s, "ion-ios7-plus-empty"), "#{tag_products_path(@tags)+'/'+tag.name}", class: "#{css_class} secondary label" %>
# <% end %>



# <span class="label">
#   <%= tag.upcase %>
# </span>
#   <%= link_to inline_icon("", "ion-ios7-close-empty"),
#     (if @tags.size > 1
#       tag_products_path(@tags.reject{ |i| i == tag})
#     else
#       products_path
#     end),
#     class: "label remove-tag"
#   %>