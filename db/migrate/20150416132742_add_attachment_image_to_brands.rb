class AddAttachmentImageToBrands < ActiveRecord::Migration
  def self.up
    change_table :brands do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :brands, :image
  end
end
