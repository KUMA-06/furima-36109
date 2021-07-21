class Buy < ApplicationRecord
  with_options presence: true do
    validates :postal
    validates :area_id
    validates :municipality
    validates :address
    validates :phone
  end
  belongs_to :history
  
end
