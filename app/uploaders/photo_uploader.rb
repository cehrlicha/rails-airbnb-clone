# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :card do
    resize_to_fill 500, 250
  end


end
