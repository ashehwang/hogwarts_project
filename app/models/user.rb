# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  age             :integer
#  gender          :string           not null
#  house           :string
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord

    attr_reader :password

    validates :first_name, presence: true, uniqueness: { scope: :last_name }
    validates :last_name, presence: true
    validates :house, inclusion: { in: ["Griffindor", "Ravenclaw", "Hufflepuff", "Slytherin"]}
    validates :gender, inclusion: { in: ["Male", "Female"] }
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token

    def full_name
        first_name + " " + last_name
    end

    has_many :hoots,
    foreign_key: :author_id,
    dependent: :destroy

    has_one :course,
    foreign_key: :professor_id,
    class_name: :Course

    has_many :enrollments,
    class_name: :Enrollment,
    foreign_key: :student_id

    has_many :courses,
    through: :enrollments,
    source: :course

    has_one :faculty,
    class_name: :Faculty,
    foreign_key: :professor_id

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user && user.is_password?(password) ? user : nil
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
