module ApplicationHelper
end

  def default_photo(record)
    if record.photo.present?
      cl_image_tag record.photo
    else
      image_tag("photo_uniq.png")
    end
  end

  def default_path_photo(record)
    if record.photo.present?
      cl_image_path record.photo
    else
      image_path('photo_uniq.png')
    end
  end

