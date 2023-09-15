class Project < ApplicationRecord
    validates :name, presence: true
    validates :deadline, presence: true
end
