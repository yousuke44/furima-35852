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
- has_many :products
- has_many :purchase_histories  


## products テーブル

| Column             | Type       | Option            |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| comment            | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| shipment_source_id | integer    | null: false       |
| days_to_ship_id    | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_history


## purchase_histories テーブル

| Column           | Type       | Option            |
| user             | references | foreign_key: true |
| product          | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
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
- belongs_to :purchase_history