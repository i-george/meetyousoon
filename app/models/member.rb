class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :group_id, uniqueness: { scope: :user_id, message: "You've already joined this group!" }

end
