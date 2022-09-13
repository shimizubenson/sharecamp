require 'rails_helper'

RSpec.describe RentalOrderInformation, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @rental_order_information = FactoryBot.build(:rental_order_information, item_id: item.id, user_id: user.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'post_codeとregion_idとcityとaddressとphone_numberとrental_days_idとtokenが存在すれば登録できる' do
        expect(@rental_order_information).to be_valid
      end

      it 'building_nameは空でも登録できる' do
        @rental_order_information.building_name = ''
        expect(@rental_order_information).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと登録できない' do
        @rental_order_information.post_code = ''
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できない' do
        @rental_order_information.post_code = '1234567'
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("郵便番号にハイフォン（-）を入力してください")
      end

      it "region_idが未選択項目だと登録できない" do
        @rental_order_information.region_id = 1
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'cityが空だと登録できない' do
        @rental_order_information.city = ''
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空だと登録できない' do
        @rental_order_information.address = ''
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("番地を入力してください")
      end

      it "phone_numberが全角数字では登録できない" do
        @rental_order_information.phone_number = '２０００００００００'
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("電話番号は不正な値です")  
      end

      it 'phone_numberが10桁より少ないと登録できない' do
        @rental_order_information.phone_number = '123456789'
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'phone_numberが11桁より大きいと登録できない' do
        @rental_order_information.phone_number = '123456789012'
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'phone_numberが空だと登録できない' do
        @rental_order_information.phone_number = ''
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("電話番号を入力してください")
      end

      it "rental_days_idが未選択項目だと登録できない" do
        @rental_order_information.rental_days_id = 1
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("泊数を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @rental_order_information.user_id = nil
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐付いていないと保存できない' do
        @rental_order_information.item_id = nil
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("Itemを入力してください")
      end

      it "tokenが空では登録できないこと" do
        @rental_order_information.token = nil
        @rental_order_information.valid?
        expect(@rental_order_information.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end