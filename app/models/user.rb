class User < ApplicationRecord
  before_create :generate_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  has_many :activities

  attribute :activity_counter, default: 0
  attribute :calorie_goal, default: 0

  validates :calorie_goal, comparison: { greater_than_or_equal_to: 0 }

  private
    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end
end
