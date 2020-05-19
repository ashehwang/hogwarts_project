# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  age         :integer
#  gender      :string           not null
#  house       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
    validates :first_name, presence: true, uniqueness: { scope: :last_name }
    validates :last_name, presence: true
    validates :house, inclusion: { in: ["Griffindor", "Ravenclaw", "Hufflepuff", "Slytherin"]}
    validates :gender, inclusion: { in: ["Male", "Female"] }

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

end
