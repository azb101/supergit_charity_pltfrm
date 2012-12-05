class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :points, :surname, :password_confirmation
  after_initialize :default_values
	has_many :donations
 
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true, :length => {:maximum => 50, :minimum => 1}
  validates :email, :presence => true, :format   => { :with => email_regex }
  
  
  
	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
  
	def encrypt_password
		if password.present?
		  self.password_salt = BCrypt::Engine.generate_salt
		  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
	  
	

	
	private
    def default_values
      self.points ||= 0
    end
end
