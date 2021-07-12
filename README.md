# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_katakana       | string | null: false |
| first_katakana      | string | null: false |
| birthday            | date   | null: false |

### Association

<!-- - has_many :comments -->
- has_many :items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | ActiveStorage                               |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| charge_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association
<!-- - has_many :comments -->
- belongs_to :user
- has_one :buy


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

<!-- - belongs_to :user -->
<!-- - belongs_to :item -->


## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_num     | integer    | null: false                    |
| limit        | date       | null: false                    |
| code         | integer    | null: false                    |
| postal       | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone        | integer    | null: false                    |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item