class User < ActiveRecord::Base
	has_secure_password
	validates :email, presence: true, format:{with: /\A[^@]+@[^@]+\z/}
	validates :name, presence: true, length:{maximun: 30}
end
