module ApplicationHelper
  def links(url_link)
    render html: root_path + url_link.pluralize.downcase
  end
  def show_field_unless_empty(model, partial_type)
  	unless  model.to_s.empty? 
    	render partial_type, field: model.value 
    end
  end
  def show_image_unless_empty(model, partial_type)
  	unless  model.to_s.empty? 
    	render partial_type, field: model.image.url 
    end
  end
end
