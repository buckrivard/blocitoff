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

	has_many :items, dependent: :destroy

  def self.find_for_database_authentication warden_conditions
	  conditions = warden_conditions.dup
	  login = conditions.delete(:login)
	  where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
	end

  def avatar_url(size)
  	gravatar_id = Digest::MD5::hexdigest(self.email).downcase
  	"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
