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

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| description        | text       | null: false       |
| category           | string     | null: false       |
| status             | string     | null: false       |
| delivery_fee       | string     | null: false       |
| origin_of_delivery | string     | null: false       |
| days               | string     | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association
- has_one_attached :image
- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefecture     | string     | null: false       |
| city           | string     | null: false       |
| district       | string     | null: false       |
| building       | string     |                   |
| tel            | string     | null: false       |
| order          | references | foreign_key: true |

### Association
- belongs_to :order