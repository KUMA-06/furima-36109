require 'rails_helper'

RSpec.describe HistoryBuy, type: :model do
  describe '商品購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @history_buy = FactoryBot.build(:history_buy, item_id: item.id, user_id: user.id)
      sleep (0.1)
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@history_buy).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @history_buy.building = ""
        expect(@history_buy).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空だと購入できないこと' do
        @history_buy.token = ""
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Token can't be blank")
      end

      it 'postalが空だと購入できないこと' do
        @history_buy.postal = ""
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Postal can't be blank")
      end

      it 'postalが全角だと購入できないこと' do
        @history_buy.postal = "１２３-１２３４"
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end

      it 'postalは３桁ハイフン４桁の半角数字でないと購入できないこと' do
        @history_buy.postal = "12-123"
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end

      it 'area_idが空だと購入できないこと' do
        @history_buy.area_id = 1
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Area can't be blank")
      end

      it 'municipalityが空だと購入できないこと' do
        @history_buy.municipality = ""
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと購入できないこと' do
        @history_buy.address = ""
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空だと購入できないこと' do
        @history_buy.phone = ""
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが全角だと購入できないこと' do
        @history_buy.phone = "０９０１２３４５６７８"
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが9桁以下だと購入できないこと' do
        @history_buy.phone = "0901234"
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが1２桁以上だと購入できないこと' do
        @history_buy.phone = "0901234567890"
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end