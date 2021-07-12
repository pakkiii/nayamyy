require 'rails_helper'

RSpec.describe Yell, type: :model do
  describe "コメント投稿機能" do
    
    before do 
      @yell = FactoryBot.build(:yell)
    end

    context '正常系' do
      it '禁止されたワードがなく300文字以内なら投稿できる' do
        expect(@yell).to be_valid
      end
    end

    context '異常系' do

      it 'コメントが入力されていないと投稿できない' do
        @yell.content = ''
        @yell.valid?
        expect(@yell.errors.full_messages).to include("コメントを入力してください")
      end

      it 'titleが301文字以上だと投稿できない' do
        @yell.content = 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはは'
        @yell.valid?
        expect(@yell.errors.full_messages).to include("コメントは300文字以内で入力してください")
      end

      it '禁止されているワードが含まれていると投稿できない' do
        @yell.content = 'すごいわかる〜でも馬鹿'
        @yell.valid?
        expect(@yell.errors.full_messages).to include("禁止ワードが含まれています。")
      end

    end
  end
end
