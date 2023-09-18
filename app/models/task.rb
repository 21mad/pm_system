class Task < ApplicationRecord
  validates :name, presence: true
  validates :priority, presence: true
  validates :status, presence: true, allow_blank: true
  validates :due_date, presence: true

  belongs_to :project
end
