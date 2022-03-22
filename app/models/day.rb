class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true
  has_many :pooh
  belongs_to :user
end
