class AvatarUploader < CarrierWave::Uploader::Base
  def content_type_whitelist
    /image\//
  end


  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:

  if Rails.env.development?
    storage :file
  else
    storage :fog
  end

  def store_dir
  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
end

end
