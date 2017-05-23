# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :card do
    cloudinary_transformation effect: "brightness:30", radius: 5,
      gravity: :face
  end


end
