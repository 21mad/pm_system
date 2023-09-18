class Project < ApplicationRecord
  validates :name, presence: true
  validates :deadline, presence: true

  has_many :tasks, dependent: :destroy
end
