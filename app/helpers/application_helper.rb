module ApplicationHelper

  def default_photo(record)
    if record.photo.present?
      cl_image_tag record.photo, height: 300, width: 400, crop: :fill
    else
      image_tag("photo_uniq.png", height: 300, width: 400, crop: :fill )
    end
  end

end
