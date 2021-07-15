class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :day_id
    validates :price 
  end

  belongs_to :user
  # has_one :history
  has_one_attached :image

end
