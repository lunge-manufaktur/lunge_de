module ApplicationHelper
	def boolean_icon(boolean)
		if boolean == true
			content_tag :span, "", class: "ion-ios7-checkmark-empty"
		else
			content_tag :span, "", class: "ion-ios7-close-empty"
		end
	end

  def title_formatter(title, titleize: true)
    suffix = " | Lunge - Der Laufladen"
    title.titleize + suffix
  end

  def meta_description(description)
    content_for(:meta_description, description)
  end

  def meta_keywords(keywords)
    content_for(:meta_keywords, keywords)
  end

  def meta_title(title)
    content_for(:meta_title, title_formatter(title))
  end

  def browser_unsupported?
    if (browser.ie6? || browser.ie7? || browser.ie8? || browser.ie9?)
      true
    else
      false
    end
  end
end
