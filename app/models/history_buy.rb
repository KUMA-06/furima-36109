class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipality, :address, :building, :phone, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :token
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format:(/\A\d{10,11}\z/)
    validates :user_id
    validates :item_id
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, history_id: history.id)
  end
end