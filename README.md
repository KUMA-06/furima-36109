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
- has_many :histories

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
- has_one :history


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
| postal       | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone        | string     | null: false                    |
| history      | references | null: false, foreign_key: true |

### Association

- belongs_to :history


## histories テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buy