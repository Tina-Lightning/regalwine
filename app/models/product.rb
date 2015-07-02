class Product < ActiveRecord::Base
  belongs_to :brand

  searchkick
  
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  mount_uploader :image, ImageUploader, mount_on: :image_file_name

  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash.merge(user_id: user_id)
    end
  end

end
