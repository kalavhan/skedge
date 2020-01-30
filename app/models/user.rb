class User < ApplicationRecord
  before_save :downcase_email
  before_create :get_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :birthdate, presence: true
  validates :gender, presence: true
  validates :username, presence: true, length: { in: 3...50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX},
  uniqueness: { case_sesitive: false}
  has_secure_password

  def remember
    token = User.make_token
    update_attributes(:remember_token, User.digest_token(token))
  end

  def User.make_token
    SecureRandom.urlsafe_base64
  end

  def User.digest_token(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def downcase_email
      self.email.downcase!
    end

    def get_token
      token = User.make_token
      self.remember_token = User.digest_token(token)
    end
end
