require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき'
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_katakana,first_katakana,birthdayが存在すれば登録できる' do
        # nicknameが空では登録できないテストコードを記述します
      end

      it 'passwordが６文字以上かつ英数字混合なら登録できる' do
        # nicknameが空では登録できないテストコードを記述します
      end

      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        # nicknameが空では登録できないテストコードを記述します
      end

      it 'last_name,first_nameが全角文字なら登録できる' do
        # nicknameが空では登録できないテストコードを記述します
      end
    
      it 'last_katakana,first_katakanaが全角カタカナなら登録できる' do
        # nicknameが空では登録できないテストコードを記述します
      end

    end
    context '新規登録できないとき'
      it 'nicknameが空では登録できない' do
        # nicknameが空では登録できないテストコードを記述します
      end

      it 'emailが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
    
      it 'emailが重複していると登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
    
      it 'emailは＠を含まないと登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
    
      it 'passwordが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
    
      it 'passwordが５文字以下では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
      
      it 'passwordは半角英数字混合でなければ登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
      
      it 'password_confirmationが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'passwordがpassword_confirmationと一致しなければ登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
      
      it 'last_nameが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end
      
      it 'last_nameは全角でなければ登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'first_nameが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'first_nameは全角でなければ登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'last_katakanaが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'last_katakanaは全角カタカナでなければ登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'first_katakanaが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'first_katakanaは全角カタカナでなければ登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'birthdayが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

    end
  end
end
