require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '購入' do
    context '購入できる' do
      it '商品購入できる' do
        expect(@address).to be_valid
      end
    end

    context '購入できない' do

      it '郵便番号が空では登録できない' do
        @address.post = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post can't be blank")
      end




    end
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end
