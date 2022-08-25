# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプケーション名

シャアキャン

# アプリケーション概要

キャンプ用品をシェア購入し、道具を揃えられることで、手軽にキャンプをすることができる

# URL

https://sharecamp-38211.herokuapp.com/


# テスト用アカウント

・　Basic認証パスワード: 1783
・　Basic認証ID: benson

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1nrDZG2-9uV56XzJBQZsYD6NXtj9Eau-IIzREBGZ3kos/edit#gid=982722306


# 実装予定の機能

現在、トップページのViewを作成中。
今後は管理者機能を実装して、管理者のみ、出品、編集、削除機能が行えるように実装予定。


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/e0138d086a50d7eb1bc8fbb0660fe1f7.jpg)](https://gyazo.com/e0138d086a50d7eb1bc8fbb0660fe1f7)

# ローカルでの動作方法

% git clone https://github.com/shimizubenson/sharecamp
% cd sharecamp
% bundle install
% yarn install

## usersテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | -----------             |
| nickname           | string | null: false             |
| encrypted_password | string | null: false             |
| email              | string | null: false unique: true|
| last_name          | string | null: false             |
| first_name         | string | null: false             |
| last_name_kana     | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | date   | null: false             |


### Association

- has_many : items
- has_many : rentals

## itemsテーブル

| Column        | Type      | Options                      |
| ----------    | --------- | ---------------------------- |
| name          | string    | null: false                  |
| description   | text      | null: false                  |
| category_id   | integer   | null: false                  |
| day_to_ship_id| integer   | null: false                  |
| price         | integer   | null: false                  |
| user          | references|null:false , foreign_key: true|

### Association

- belongs_to :user
- has_one :rental

## rentalsテーブル

| Column     | Type      | Options                      |
| ---------- | --------- | ---------------------------- |
| item       | references|null: false, foreign_key: true|
| user       | references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :order_information


## order_informationsテーブル

| Column        | Type      | Options                      |
| ----------    | --------- | ---------------------------- |
| post_code     | string    | null: false                  |
| region_id     | integer   | null: false                  |
| city          | string    | null: false                  |
| address       | string    | null: false                  |
| building_name | string    |                              |
| phone_number  | string    | null: false                  |
| rental        | references|null:false , foreign_key: true|

### Association

- belongs_to :rental 






