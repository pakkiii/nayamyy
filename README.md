# アプリの概要
プログラミングスクールを卒業し、最初に作成したアプリを一から作り直しました。
前回のLife countをすでにご参照いただいている方は下記データベース設計からご覧ください。

## ペルソナ
家庭や仕事場・学校などさまざまなストレスがかかる現代社会において自分の悩みを投稿し、他社のアドバイスや共感を得ることで少しでも
勇気づけられるようなアプリを目指し開発しました。



## dio図

めちゃ見にくいです💦

[![Image from Gyazo](https://i.gyazo.com/a088943927d4ad2396e017b6e6fd86f4.png)](https://gyazo.com/a088943927d4ad2396e017b6e6fd86f4)

## 各種実装済み内容

### 機能
・投稿
・コメント（投稿への）
・いいね  （投稿への）
・フォロー
・DM      （相互フォローのみ）
・通知

### javascript（gem）
・ chart-tick （グラフ）
・ bxslider
・ groupdate (javaではありませんがchart-tickのため導入)


## 一覧画面
上記gemのchartkickで一覧ページを実装しています。

新しい順・いいねが多い順・コメントが多い順で各々並び替えています。

[![Image from Gyazo](https://i.gyazo.com/aafa888a7c6ebf40f01e513eb94143d8.gif)](https://gyazo.com/aafa888a7c6ebf40f01e513eb94143d8)


## 新規投稿
active-hashにて悩んでいる時期や内容を洗濯します。

[![Image from Gyazo](https://i.gyazo.com/f074b234faf509484a06950443a81c30.gif)](https://gyazo.com/f074b234faf509484a06950443a81c30)

## マイページ実装
chartkickを用いてグラフを二種類追加しました。
一つ目はユーザー（自分）がどのカテゴリーの悩みを多く投稿しているか
二つ目はフォロワーがいつできたかです

[![Image from Gyazo](https://i.gyazo.com/bf7f5f426594fe526a8877a4d93be6f4.gif)](https://gyazo.com/bf7f5f426594fe526a8877a4d93be6f4)

ここで正直に白状します。上記動画はローカルです🙇‍♂️🙇‍♂️
デプロイでは問題ないのですが、ユーザーページに飛んだ際エラーが起きログを見ると本番環境のsqlにgemのgroupdayがうまく噛み合っておらず調べてみると唯一見つかった解決策では対処できなかったため現在AWSのマイページはWe are sorryになっています。
ただ今泣きそうなくらい必死に対応しているため多めに見てもらえると幸いです、、、、

## コメント機能
実際にアプリを使ってもらうことを想定し、暴言などで精神的とどめを刺させないために
特定のワードはカスタムバリデーションで対策しました。

[![Image from Gyazo](https://i.gyazo.com/69473f808a68b81c34e08b764b68f2f3.gif)](https://gyazo.com/69473f808a68b81c34e08b764b68f2f3)

## DM機能

お互いにフォローしている場合のみDM機能を使用できるようにしています。

[![Image from Gyazo](https://i.gyazo.com/3dd5f828b818f7c37b1fbe84479db63d.gif)](https://gyazo.com/3dd5f828b818f7c37b1fbe84479db63d)

## 通知機能

フォロー・いいね・コメント・DMに関して通知が来るように実装しています。
また各々リンクからページへ飛べるように実装しました。

[![Image from Gyazo](https://i.gyazo.com/0edf9a8ce14fd8160afc4e4040ddfde1.gif)](https://gyazo.com/0edf9a8ce14fd8160afc4e4040ddfde1)

## 検索機能
ワード検索ではユーザーと投稿の各テキストに照合するよう実装しました。
またフォーム下部の検索ボタンでは各々カテゴリーで検索もできます。

[![Image from Gyazo](https://i.gyazo.com/23755667c3bd6455806c28946be84754.gif)](https://gyazo.com/23755667c3bd6455806c28946be84754)


# テーブル設計


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| age                 | integer | null: false               |
| nick_name           | string  | null: false               |
| sex                 | integer | null: false               |

### Association

- has_many :lives
- has_many :yells

- has_many :likes
- has_many :has_many :liked_lives, through: :likes, source: :life

- has_many :relationships, dependent: :destroy
- has_many :followings, through: :relationships, source: :follower
- has_many :passive_relationships, class_name: 'Relationship',  foreign_key: 'follower_id', dependent: :destroy 
- has_many :follower, through: :passive_relationships, source: :use

- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :rooms, through: :entries

##  lifeテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| bad_thing   | text       | null: false                    |
| hope        | text       | null: false                    |
| tired_id    | integer    | null: false                    |
| how_long_id | integer    | null: false                    |
| want_id     | integer    | null: false                    |
| month_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :yells, dependent: :destroy

- has_many :lights, dependent: :destroy

- has_many :liked_users, through: :likes, source: :user
- has_many :likes



##  likeテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| life        | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :life



##  relationshipテーブル

| Column      | Type       | Options                           |
| ----------- | ---------- | --------------------------------- |
| user        | references | null: false, foreign_key: true    |
| follower    | references | foreign_key: { to_table: :users } |

### Association

- belongs_to :user


##  yellテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| life        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :life
- has_many :lights, dependent: :destroy

##  entryテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| room        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room



##  lightテーブル

| Column      | Type       | Options                                       |
| ----------- | ---------- | --------------------------------------------- |
| visitor     | references | null: false, foreign_key: { to_table: :users }|
| visited     | references | null: false, foreign_key: { to_table: :users }|
| room        | references | null: false, foreign_key: true                |
| life        | references | null: false, foreign_key: true                |
| yell        | references | null: false, foreign_key: true                |
| message     | references | null: false, foreign_key: true                |
| checked     | boolean    | default: false,  null: false                  |
| action      | string     |                                               |

### Association

- belongs_to :visitor, class_name: "User", optional: true 
- belongs_to :visited, class_name: "User", optional: true
- belongs_to :life, optional: true
- belongs_to :yell, optional: true
- belongs_to :message, optional: true
- belongs_to :room, optional: true

##  messageテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| room        | references | null: false, foreign_key: true |
| content     | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :room
- has_many :lights, dependent: :destroy


##  roomテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |

### Association

- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :users, through: :entries
- has_many :lights, dependent: :destroy