class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: (300..9999999)}
    with_options numericality: { other_than: 1, message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :charge_id
      validates :area_id
      validates :day_id
    end
  end

  belongs_to :user
  # has_one :history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :day

end