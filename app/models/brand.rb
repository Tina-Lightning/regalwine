class Brand < ActiveRecord::Base
	has_many :products, dependent: :destroy

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Brand.create! row.to_hash
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
end
