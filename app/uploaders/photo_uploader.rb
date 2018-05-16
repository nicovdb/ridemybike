class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'


  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 50,
      width: 35, height: 35, crop: :thumb, gravity: :face
  end
end
