require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入' do
    context '購入できる' do

      it '商品購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名なしでも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない' do

      it '郵便番号が空では登録できない' do
        @order_address.post = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post can't be blank")
      end

      it '市町村が空では登録できない' do
        @order_address.area = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it '番地が空では登録できない' do
        @order_address.detail_area = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Detail area can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end

      it '郵便番号ハイフンないと保存できないこと' do
        @order_address.post = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_address.area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it '電話番号が9桁以下だと購入できない' do
        @order_address.telephone = '09011111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is too short")
      end

      it '電話番号が文字でないと購入できない' do
        @order_address.telephone = '０丸011111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end

      it '電話番号が12桁以上だと購入できない' do
        @order_address.telephone = '0901111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is too short")
      end

      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end