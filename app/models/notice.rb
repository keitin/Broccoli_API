class Notice < ActiveRecord::Base
  
  enum category: [:like, :followed, :comment]
  enum status: [:unread, :read]

  belongs_to :user
  belongs_to :blog

end
