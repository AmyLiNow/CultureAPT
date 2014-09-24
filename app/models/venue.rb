class Venue < ActiveRecord::Base
	# join address fields to geocode
	def address
		[name, street, city, state, zip].compact.join(', ')
	end

	# geocoding
	geocoded_by :address
	after_validation :geocode #, :if => :address_changed?

	def self.search(search)
		where(['name LIKE ?', "%#{search}%"])
	end

end
