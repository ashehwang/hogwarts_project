# == Schema Information
#
# Table name: faculties
#
#  id           :bigint           not null, primary key
#  professor_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subject      :string
#  title        :string
#
class Faculty < ApplicationRecord

    belongs_to :professor,
    class_name: :User,
    foreign_key: :professor_id
    
end
