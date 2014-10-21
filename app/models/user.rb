class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save :normalize_fields

#Validates name:
validates :name,
  presence: true,
  length: {maximum:50}

  #Validates email

validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /[^@]+@[^@]+/}

validates :password,
  length: {minimum: 8}

 has_secure_password

  #create a new remember token for the user
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end


  def self.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  #creates a new sessions token for the user
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end

  #normalize fields for consistency
  def normalize_fields
    self.email.downcase!
  end

end
