require 'rails_helper'
describe User do
  describe '#create' do
    it "emailがない場合は登録できないこと" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("cant be blank")
    end
  end
end