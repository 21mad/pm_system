class Project < ApplicationRecord
  validates :name, presence: true
  validates :deadline, presence: true
  validates :user_id, presence: true

  has_many :tasks, dependent: :destroy
  belongs_to :user
end
