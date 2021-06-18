require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,dete_of_birthが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'date_of_birthが空では登録できないこと' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailが@を含まない場合登録できないこと' do
      @user.email = 'testcode.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下だと登録できない' do
      @user.password = '111aa'
      @user.password_confirmation = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは英字だけだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password contain both letters and nembers')
    end

    it 'passwordは数字だけだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password contain both letters and nembers')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'bbb222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、半角(カタカナ)では登録できない' do
      @user.last_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Please enter your name in full-width')
    end

    it 'お名前(全角)は、半角(カタカナ)では登録できない' do
      @user.first_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Please enter your name in full-width')
    end

    it 'お名前(全角)は、半角(数字)では登録できない' do
      @user.last_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Please enter your name in full-width')
    end

    it 'お名前(全角)は、半角(数字)では登録できない' do
      @user.first_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Please enter your name in full-width')
    end

    it 'お名前(全角)は、全角(数字)では登録できない' do
      @user.last_name = '２２２'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Please enter your name in full-width')
    end

    it 'お名前(全角)は、全角(数字)では登録できない' do
      @user.first_name = '２２２'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Please enter your name in full-width')
    end

    it 'お名前(全角)は、全角(英字)では登録できない' do
      @user.last_name = 'ＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Please enter your name in full-width')
    end

    it 'お名前(全角)は、全角(英字)では登録できない' do
      @user.first_name = 'ＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Please enter your name in full-width')
    end

    it 'お名前(全角)は、半角(英字)では登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Please enter your name in full-width')
    end

    it 'お名前(全角)は、半角(英字)では登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Please enter your name in full-width')
    end

    it 'お名前(全角)は、記号は登録できない' do
      @user.last_name = '山田!!!'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Please enter your name in full-width')
    end

    it 'お名前(全角)は、記号は登録できない' do
      @user.first_name = '太郎!!!'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、半角(カタカナ)では登録できない' do
      @user.last_name_kana = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、半角(カタカナ)では登録できない' do
      @user.first_name_kana = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、半角(数字)では登録できない' do
      @user.last_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、半角(数字)では登録できない' do
      @user.first_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、全角(数字)では登録できない' do
      @user.last_name_kana = '２２２'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、全角(数字)では登録できない' do
      @user.first_name_kana = '２２２'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、全角(英字)では登録できない' do
      @user.last_name_kana = 'ＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、全角(英字)では登録できない' do
      @user.first_name_kana = 'ＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、半角(英字)では登録できない' do
      @user.last_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、半角(英字)では登録できない' do
      @user.first_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、記号は登録できない' do
      @user.last_name_kana = '山田!!!'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、記号は登録できない' do
      @user.first_name_kana = '太郎!!!'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、漢字は登録できない' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Please enter your name in full-width')
    end

    it 'お名前カナ(全角)は、漢字は登録できない' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Please enter your name in full-width')
    end
  end
end
