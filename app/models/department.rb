class Department < ApplicationRecord
  scope :without_root, -> { where.not(department_code: '#root') }
end
