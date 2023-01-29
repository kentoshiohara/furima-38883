require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式出ないと保存できないこと' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'districtが空だと保存できないこと' do
        @order_address.district = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("District can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが全角数字だと保存できないこと' do
        @order_address.tel = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが10桁未満だと保存できないこと' do
        @order_address.tel = 0o00000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上だと保存できないこと' do
        @order_address.tel = 0o00000000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'userが紐ついていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐ついていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
