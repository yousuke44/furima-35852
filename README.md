# テーブル設計

## users テーブル

| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| year               | integer | null: false |
| month              | integer | null: false |
| day                | integer | null: false |


## products テーブル

| Column          | Type       | Option        |
| --------------- | ---------- | ------------- |
| image           |            | ActiveStorage |
| name            | string     | null: false   |
| comment         | text       | null: false   |
| category        | string     | null: false   |
| condition       | string     | null: false   |
| delivery_charge | string     | null: false   |
| shipment_source | string     | null: false   |
| days_to_ship    | string     | null: false   |
| price           | integer    | null: false   |
| user            | references |               |


## product_purchases テーブル

| Column                | Type       | Option      |
| --------------------- | ---------- | ----------- |
| card_number           | integer    | null: false |
| expiration_date_month | integer    | null: false |
| expiration_date_year  | integer    | null: false |
| security_code         | integer    | null: false |
| postal_code           | string     | null: false |
| state                 | string     | null: false |
| city                  | string     | null: false |
| address               | string     | null: false |
| building_name         | string     | null: false |
| phone_number          | integer    | null: false |
| user                  | references |             |
| product               | references |             |


## comments テーブル

| Column  | Type       | Option      |
| ------- | ---------- | ----------- |
| text    | text       | null: false |
| user    | references |             |
| product | references |             |