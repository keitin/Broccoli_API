class Notice < ActiveRecord::Base
  
  enum category: [:like, :followed, :comment]
  enum status: [:unread, :read]

  belongs_to :user
  belongs_to :blog
  belongs_to :from_user, class_name: "User", foreign_key: "from_user_id"

end
