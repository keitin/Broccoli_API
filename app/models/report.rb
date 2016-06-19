class Report < ActiveRecord::Base
  enum status: { spam: 0, objectionable: 1 }
end
