class User < ActiveRecord::Base
	#User Gravtar picture
	include Gravtastic
  	gravtastic :secure => true,
              :filetype => :png,
              :size => 120
	#Password
	has_secure_password
	#Validation
	validates :email, presence: true, format:{with: /\A[^@]+@[^@]+\z/}
	validates :name, presence: true, length:{maximum: 30}
end
