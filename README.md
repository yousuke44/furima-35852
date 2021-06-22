# テーブル設計

## users テーブル

| Column             | Type    | Option                   |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| date_of_birth      | date    | null: false              |

### Association
- has_many :items
- has_many :orders  


## items テーブル

| Column                 | Type       | Option            |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| comment                | text       | null: false       |
| category_id            | integer    | null: false       |
| sales_status_id        | integer    | null: false       |
| shipping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column           | Type       | Option            |
| user             | references | foreign_key: true |
| item             | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column                | Type       | Option            |
| --------------------- | ---------- | ----------------- |
| postal_code           | string     | null: false       |
| state_id              | integer    | null: false       |
| city                  | string     | null: false       |
| address               | string     | null: false       |
| building_name         | string     |                   |
| phone_number          | string     | null: false       |
| purchase_history      | references | foreign_key: true |

### Association
- belongs_to :orders