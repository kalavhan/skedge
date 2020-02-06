class User < ApplicationRecord
  before_save :downcase_email
  before_create :get_session_token
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX},
  uniqueness: { case_sesitive: false}
  has_secure_password

  def remember
    token = User.make_token
    update_attributes(:session_token => User.digest_token(token))
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

    def get_session_token
      token = User.make_token
      self.session_token = User.digest_token(token)
    end
end
