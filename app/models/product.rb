class Product < ActiveRecord::Base
  belongs_to :brand

  searchkick

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  #def should_generate_new_friendly_id?
  #  new_record?
  #end
  
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  mount_uploader :image, ImageUploader, mount_on: :image_file_name

  mount_uploader :shelf_talker, ShelfTalkerUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.

  mount_uploader :tech_sheet, TechSheetUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.

  mount_uploader :case_card, CaseCardUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.

  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash.merge(user_id: user_id)
    end
  end

end
