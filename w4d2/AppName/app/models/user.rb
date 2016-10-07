



class User < ActiveRecord::Base
  validates :password_digest, length: {minimum: 6, allow_nil: true}
  validates :password_digest, presence: true


  # this method is okay, as the method name isn't really releavant
  # to the internals of the method
  def password=(password)
    # we set their password to a hash, so it's encrypted now!
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    # we use new here, because we don't want to save anything into the DB
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
