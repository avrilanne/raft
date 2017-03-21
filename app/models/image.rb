class Image < ActiveRecord::Base
  belongs_to :group
  has_attached_file :group_image, styles: { thumb: "100x100#"}, default_url: "thumb/missing.png"
  validates_attachment_content_type :group_image, content_type: /\Aimage\/.*\z/
end
