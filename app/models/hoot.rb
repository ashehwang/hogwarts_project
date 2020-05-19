# == Schema Information
#
# Table name: hoots
#
#  id             :bigint           not null, primary key
#  author_id      :integer          not null
#  body           :text             not null
#  parent_hoot_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Hoot < ApplicationRecord

    validates :author_id, presence: true

    belongs_to :author,
    class_name: :User, 
    foreign_key: :author_id

    belongs_to :parent_hoot,
    class_name: :Hoot,
    foreign_key: :parent_hoot_id,
    optional: true

    has_many :replies,
    class_name: :Comment,
    foreign_key: :parent_hoot_id
    # optional: true
end
