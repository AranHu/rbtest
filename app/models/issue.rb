class Issue < ActiveRecord::Base
  has_many :icomments, dependent: :destroy
end
