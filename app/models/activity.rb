class Activity < ApplicationRecord
  paginates_per 5

  belongs_to :user

  validates :calories, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :date, presence: true

  attribute :burned, :boolean, default: false

  after_commit :update_counter

  def update_counter
    user = self.user
    user.update_attribute(:activity_counter, user.activities.count)
  end
end
