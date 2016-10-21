FactoryGirl.define do

  factory  :post, :class => Cms9::Post do |f|
  	f.id 1
 	  f.post_definition_id 1
    f.created_at 'Fri, 14 Oct 2016 06:55:17 UTC +00:00'
    f.updated_at 'Fri, 14 Oct 2016 06:55:17 UTC +00:00'
  end

  factory :post_definition, :class => Cms9::PostDefinition do |f|
  	f.id 1
 	  f.name 'Blog2'    
  end

  factory :field, :class => Cms9::Field do |f|
  	f.id 1
    f.post_id 1
  	f.post_field_id 1
  	f.value "WEB DEVELOPER POSITION"
  	f.image nil
  	f.image_uid nil
  	f.image_name nil
    f.created_at 'Fri, 14 Oct 2016 06:55:17 UTC +00:00'
    f.updated_at 'Fri, 14 Oct 2016 06:55:17 UTC +00:00'
  end

  factory :post_field, :class => Cms9::PostField do |f|
    f.id 1
    f.post_definition_id 1
    f.name "Title"
    f.field_type "text"
    f.required false
    f.metadata nil
  end

end

