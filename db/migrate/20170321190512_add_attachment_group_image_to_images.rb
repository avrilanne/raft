class AddAttachmentGroupImageToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :group_image
    end
  end

  def self.down
    remove_attachment :images, :group_image
  end
end
