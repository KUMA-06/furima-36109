class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
NAME_KATAKANA = /\A[ァ-ヴー]+\z/u.freeze

  validates :password, format:{ with: PASSWORD_REGEX}
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: NAME_REGEX} 
  validates :first_name, presence: true, format: { with: NAME_REGEX} 
  validates :last_katakana, presence: true, format:{ with: NAME_KATAKANA}
  validates :first_katakana, presence: true, format:{ with: NAME_KATAKANA}
  validates :birthday, presence: true

  # has_many :items
  # has_many :histories

end
