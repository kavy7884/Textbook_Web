class User < ActiveRecord::Base
	#User Gravtar picture
	include Gravtastic
  	gravtastic :secure => true,
              :filetype => :png,
              :size => 120
    #Before save call back
    before_save{ self.email= email.downcase}
    before_save{ self.session_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)}
	#Password
	has_secure_password
	#Validation
	validates :email, presence: true, format:{with: /\A[^@]+@[^@]+\z/}
	validates :name, presence: true, length:{maximum: 30}
end
