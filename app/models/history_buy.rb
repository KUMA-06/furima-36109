class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipality, :address, :building, :phone, :history_id, :user_id, :item_id, :buy_id

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format:(/\d{10-11}/)
    validates :history_id
    validates :user_id
    validates :item_id
    validates :buy_id
  end

  def save
    history = history.create(user_id: user_id, item_id: item_id)
    buy.create(postal: postal, area_id: area_id, municipality: municipality, address: address, phone: phone, history_id: history.id)
  end
end