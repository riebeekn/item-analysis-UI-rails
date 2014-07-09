class FileUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "#{model.id}/inputs/"
  end
end
