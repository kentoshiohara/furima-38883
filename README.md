# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false              |
| password_confirmation | string | null: false              |
| family_name           | string | null: false              |
| first_name            | string | null: false              |
| family_name_kana      | string | null: false              |
| first_name_kana       | string | null: false              |
| date_of_birth         | date   | null: false              |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| description    | text       | null: false       |
| price          | integer    | null: false       |
| category       | string     | null: false       |
| status         | string     | null: false       |
| user_id        | references | foreign_key: true |

### Association
- has_one_attached :image
- belongs_to :user
- has_one :shipping_condition
- has_one :orders
- has_many :comments

## comments テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| text           | text       | null: false       |
| user_id        | references | foreign_key: true |
| item_id        | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## orders テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user_id        | references | foreign_key: true |
| item_id        | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :item

## destinations テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefecture     | string     | null: false       |
| city           | string     | null: false       |
| district       | string     | null: false       |
| building       | string     |                   |
| tel            | integer    | null: false       |
| order_id       | references | foreign_key: true |

### Association
- has_one :order

## shipping_conditions テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| delivery_fee       | string     | null: false       |
| origin_of_delivery | string     | null: false       |
| days               | string     | null: false       |
| item_id            | references | foreign_key: true |

### Association
- has_one :item
