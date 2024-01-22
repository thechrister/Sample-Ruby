# app/uploaders/photo_uploader.rb

class PhotoUploader < CarrierWave::Uploader::Base
    storage :file # Use the file storage (you can change this based on your needs)
  
    # Customize the storage directory
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    # Allow only image file types
    def extension_whitelist
      %w[jpg jpeg gif png]
    end
  
    # Override the filename of the uploaded files
    def filename
      "#{secure_token}.#{file.extension}" if original_filename.present?
    end
  
    private
  
    # Generate a unique filename using SecureRandom
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end
  end
  