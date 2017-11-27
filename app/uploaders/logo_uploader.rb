# frozen_string_literal: true

class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [400, 400]

  version :thumb do
    process resize_to_fit: [200, 150]
  end

  version :medium do
    process resize_to_fill: [400, 300]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def content_type_whitelist
    %r{image\/}
  end
end
