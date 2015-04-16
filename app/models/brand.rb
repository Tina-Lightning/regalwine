class Brand < ActiveRecord::Base
	has_many :products, dependent: :destroy

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Brand.create! row.to_hash
		end
	end
end
