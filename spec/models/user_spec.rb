require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_katakana,first_katakana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    
      it 'emailは＠を含まないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    
      it 'passwordが５文字以下では登録できない' do
        @user.password = '55a55'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '666666'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordがpassword_confirmationと一致しなければ登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      
      it 'last_nameは全角でなければ登録できない' do
        @user.last_name = 'asdf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは全角でなければ登録できない' do
        @user.first_name = 'asdf'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_katakanaが空では登録できない' do
        @user.last_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana can't be blank")
      end

      it 'last_katakanaは全角カタカナでなければ登録できない' do
        @user.last_katakana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana is invalid")
      end

      it 'first_katakanaが空では登録できない' do
        @user.first_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana can't be blank")
      end

      it 'first_katakanaは全角カタカナでなければ登録できない' do
        @user.first_katakana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana is invalid")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
