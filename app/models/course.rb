# == Schema Information
#
# Table name: courses
#
#  id           :bigint           not null, primary key
#  subject_name :string           not null
#  professor_id :integer
#
class Course < ApplicationRecord
    validates :subject_name, presence: true, uniqueness: true

    belongs_to :professor,
    class_name: :User,
    foreign_key: :professor_id    

    has_many :enrollments,
    class_name: :Enrollment,
    foreign_key: :course_id

    has_many :students,
    through: :enrollments,
    source: :student
end
