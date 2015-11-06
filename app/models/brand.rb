class Brand < ActiveRecord::Base
	has_many :products, dependent: :destroy
	belongs_to :user

	mount_uploader :image, ImageUploader, mount_on: :image_file_name

	searchkick

	#has_attached_file :image,
	#:styles => {
  	#:tiny => "25x25#",
  	#:thumb => "100x100#",
  	#:small  => "150x150>",
  	#:medium => "300x300>" },
  	#:default_url => "default_:style.png"

	#has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/Wine-default.jpg"
	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	#def self.import(file)
		#CSV.foreach(file.path, headers: true) do |row|
		#	Brand.create! row.to_hash
		#end
	#end

	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]
	#def should_generate_new_friendly_id?
    #	new_record?
  	#end

	def self.import(file, user_id)
	    CSV.foreach(file.path, headers: true) do |row|
	      Brand.create! row.to_hash.merge(user_id: user_id)
	    end
	end

	def self.to_csv 
		CSV.generate do |csv|
			csv << column_names
			all.each do |brand|
				csv << brand.attributes.values_at(*column_names)
			end
		end
	end

	def initial
	  return '?' if name.blank?
	  # name.[0].upcase (updated to get the first character )
	  name.slice(0).chr.upcase
	end

end
