# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    attr_reader :password
    after_initialize :ensure_session_token


    validates :user_name, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true
    validates :session_token, :user_name, uniqueness: true

    has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat

    def self.find_by_credentials(username, password)
        user = User.find_by(user_name: username)

        if user && user.is_password?(password)
            return user
        else
            nil
        end 
    end

    def is_password?(password)
        bcrypt_password = BCrypt::Password.new(self.password_digest)

        bcrypt_password.is_password?(password)
    end

     def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password)
    end
end


