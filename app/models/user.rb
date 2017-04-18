class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  
	validates :username,
		:presence => true,
		:uniqueness => {
			:case_sensitive => false
		}

	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      	conditions[:email].downcase! if conditions[:email]
        where(conditions.to_hash).first
      end
    end
end