# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_katakana       | string | null: false |
| first_katakana      | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :comments
- has_many :items

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | ActiveStorage                               |
| item_name    | string     | null: false                    |
| description  | text       | null: false                    |
| condition    | string     | null: false                    |
| category     | string     | null: false                    |
| charge       | string     | null: false                    |
| area         | string     | null: false                    |
| day          | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association
- has_many :comments
- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item