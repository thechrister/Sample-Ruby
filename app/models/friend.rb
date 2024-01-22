class Friend < ApplicationRecord
    mount_uploader :photo, PhotoUploader 
    has_one_attached :excel_file
  end   
  