require 'rails_helper'
describe User do
  describe '#create' do
    
    it "nickname,email,password,password_confirmationがあれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it " nicknameが9文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 8 characters)")
    end

    it "nicknameが8文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaaaa")
      expect(user).to be_valid
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it " passwordが5文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end