class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates_length_of :password, :minimum => 2

  def authenticate_with_credentials(email, password) 
    userEmail = email.downcase.strip
    user = User.find_by_email(userEmail)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  

end


