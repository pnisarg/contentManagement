class AdminUser < ActiveRecord::Base

	has_secure_password
	# self.table_name = "admin_users"
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z]+\.[a-z]{2,4}\Z/i
	# validates_presence_of :first_name
	# validates_presence_of :last_name
	# validates_presence_of :username
	# validates_uniqueness_of :username
	# validates_presence_of :email
	# validates_length_of :first_name, :maximum => 25
	# validates_length_of :last_name, :maximum => 50
	# validates_length_of :username, :within => 8..25
	# validates_length_of :email, :maximum => 100
	# validates_format_of :email, :with => EMAIL_REGEX
	# validates_confirmation_of :email
	
	validates :first_name, :presence => true,
	:length => {:maximum => 25}
	validates :last_name, :presence => true,
	:length => {:maximum => 50}
	validates :username, :length =>{:within => 8..25},
	:uniqueness => true
	validates :email, :presence => true,
	:length => {:maximum => 100},
	:format => EMAIL_REGEX,
	:confirmation => true

	scope :sorted, lambda{ order("admin_users.last_name ASC", "admin_users.first_name ASC")}

	def name
		"#{first_name} #{last_name}" 
	end

end
