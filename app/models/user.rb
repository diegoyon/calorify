class User < ApplicationRecord
  before_create :generate_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  has_many :activities

  attribute :activity_counter, default: 0

  private

    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end
end
