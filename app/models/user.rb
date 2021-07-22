class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  NAME_KATAKANA = /\A[ァ-ヴー]+\z/u.freeze

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_katakana, format: { with: NAME_KATAKANA }
    validates :first_katakana, format: { with: NAME_KATAKANA }
    validates :birthday
  end
  validates :password, format: { with: PASSWORD_REGEX }

  has_many :items
  has_many :histories
end
