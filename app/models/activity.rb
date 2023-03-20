class Activity < ApplicationRecord
  validates :calories, presence: true
  validates :description, presence: true, length: { maximum: 200 }

  attribute :burned, :boolean, default: false
end
