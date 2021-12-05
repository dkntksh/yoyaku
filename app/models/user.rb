class User < ApplicationRecord

  belongs_to :department

  validates :department_id, presence: true

end
