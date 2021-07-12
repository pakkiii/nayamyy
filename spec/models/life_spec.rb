require 'rails_helper'

RSpec.describe Life, type: :model do
  before do
    @life = FactoryBot.build(:life)
  end

  describe "投稿機能" do

    context '正常系' do
      it '全ての情報が指定された内容通り存在すれば登録できる' do
        expect(@life).to be_valid
      end
    end

    context '異常系' do

      it 'titleが入力されていないと投稿できない' do
        @life.title = ''
        @life.valid?
        expect(@life.errors.full_messages).to include("タイトルを入力してください")
      end

      it 'titleが16文字以上だと投稿できない' do
        @life.title = 'こんにちはこんにちはこんにちはは'
        @life.valid?
        expect(@life.errors.full_messages).to include("タイトルは15文字以内で入力してください")
      end


      it 'bad_thing（現状の辛いことを文章で)が入力されていなければ投稿できない' do
        @life.bad_thing = ''
        @life.valid?
        expect(@life.errors.full_messages).to include("つらいことを入力してください")
      end

      it 'hope(今の状況で感謝できること)が入力されていないと投稿できない' do
        @life.hope = ''
        @life.valid?
        expect(@life.errors.full_messages).to include("感謝できることを入力してください")
      end

      it 'how_long_id(あなたのライフはあといくつ？)が選択されていないと投稿できない' do
        @life.how_long_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("ライフがどれくらいもちそうかは1以外の値にしてください")
      end
    
      it 'tired_id(しんどいカテゴリー)が選択されていないと投稿できない' do
        @life.tired_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("しんどいカテゴリーは1以外の値にしてください")
      end

      it 'want_id(今何がしたいか)が選択されていないと投稿できない' do
        @life.want_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("今一番したいことは1以外の値にしてください")
      end

      it 'month_id(今の季節)が選択されていないと投稿できない' do
        @life.month_id = 1
        @life.valid?
        expect(@life.errors.full_messages).to include("どの季節が近いかは1以外の値にしてください")
      end

      

    end
  end
end
