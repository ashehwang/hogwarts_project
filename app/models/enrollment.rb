# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer          not null
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord

    belongs_to :course,
    class_name: :Course,
    foreign_key: :course_id

    belongs_to :student,
    class_name: :User,
    foreign_key: :student_id

end
