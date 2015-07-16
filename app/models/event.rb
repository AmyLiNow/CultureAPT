class Event < ActiveRecord::Base

	validates_uniqueness_of :event_num

	def self.search search
		# return scope unless search.present? 
		where(['name LIKE ? OR category LIKE ? OR subcategory LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]) #column name before LIKE ?, change it to the correct name.
	end

	def self.findDates startDate, endDate
		# where(['start_date Like ? AND end_Date LIKE ?', "%#{startDate}%", "%#{endDate}%" ])
		# where(['start_date >= ? AND end_date <= ?', "%#{startDate}%", "%#{endDate}%"])
		# where(['? <= start_date AND ? >= end_date', "%#{startDate}%", "%#{endDate}%"])
	end

	def self.findAllCategories cat1, cat2, cat3
		where(['category Like ? OR category Like ? OR category Like ?', "%#{cat1}%" , "%#{cat2}%", "%#{cat3}%"])
	end

	def self.findTwoCategories cat1, cat2
		where(['category Like ? OR category Like ?', "%#{cat1}%" , "%#{cat2}%"])
	end

	def self.findCategory cat
		where(['category Like ?', "%#{cat}%"])
	end
	
end
