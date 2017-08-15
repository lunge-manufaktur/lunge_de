module ProductsHelper

  def search_query_params
    if params[:q].present?
      "?#{request.query_parameters.except(:commit, :utf8).to_param}"
    end
  end

  def parameterize_tags(tags)
    tags.map{ |tag| tag.gsub(" ", "-") }.join("+")
  end

  def deparameterize_tags(tags)
    tags&.split('+')&.map { |tag| tag.gsub('-', ' ') }
  end

  def prepare_single_tag(tag: tag)
    tag.gsub(" ", "-")
  end

  def tag_to_remove(tag_name)
    tags  = @tags.reject{|tag| tag == tag_name}.map{ |tag| tag.gsub(" ", "-") }.join("+")
    tag_url_part = tags.present? ? tag_products_path(tags: tags) : products_path
    search_url_part = search_query_params
    link = "#{tag_url_part}#{search_url_part}"

    link_to(
      (
        content_tag(:span, tag_name).concat(
        content_tag(:span, "", class: "ion-close suffix"))
      ),
      link,
      class: "label tag-to-remove"
    )
  end



  def tag_to_add(tag_name)
    tag_url_part = tag_products_path(tags: "#{parameterize_tags(@tags)}+#{prepare_single_tag(tag: tag_name)}")
    search_url_part = search_query_params
    link = "#{tag_url_part}#{search_url_part}"


    link_to(
      (
        content_tag(:span, tag_name).concat(
        content_tag(:span, "", class: "ion-plus suffix"))
      ),
      link,
      class: "label tag-to-add"
    )
  end



  def first_tag_to_add(tag_name)
    tag_url_part = tag_products_path(tags: prepare_single_tag(tag: tag_name))
    search_url_part = search_query_params
    link = "#{tag_url_part}#{search_url_part}"

    link_to(
      (
        content_tag(:span, tag_name).concat(
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

  def search_filter
    # ul.inline-list
    #   li Suche:
    #   li 
    #     - search_filter.reject{|k, v| v.empty? || v == "0"}.each do |k, v|
    #       span.label = "#{k}: #{v}"

    if params[:q].present?
      {
        "Marke": Brand.find(params[:q][:brand_id_eq])&.name,
        "Bezeichnung": params[:q][:name_or_sku_or_description_cont],
        "Reduziert": params[:q][:on_sale] ? "Ja" : "Nein"
      }
    end
  end

end