class Image < ActiveRecord::Base

  has_attached_file :group_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "thumb/missing.png"
  validates_attachment_content_type :group_image, content_type: /\Aimage\/.*\z/
  belongs_to :group


end
