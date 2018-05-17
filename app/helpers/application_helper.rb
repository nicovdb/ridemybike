module ApplicationHelper

  def avatar_photo(record)
    options = { class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown" }
    if record.photo.present?
      cl_image_tag(record.photo, options)
    else
      image_tag('photo_uniq.png', options)
    end
  end


  def default_path_photo(record)
    if record.photo.present?
      cl_image_path record.photo
    else
      image_path('photo_uniq.png')
    end
  end

end

