class Restaurant < ApplicationRecord
  validates_presence_of :name

  mount_uploader :image, PhotoUploader

  belongs_to :catedory, optional: true
end
