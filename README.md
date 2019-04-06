# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|

|email|string|null: false, unique: true|
|password|string|null: false|

|phone|integer|null: false, unique: true|
|birth|integer|
|postal_cord|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|

|nickname|string|null: false|
|intro|text|null :false|

|card|integer|
|expiration|integer|
|cord|integer|

|sales|integer|
|point|integer|

### Association
- has_many :reviews
- has_many :comments
- has_many :items


## Itemテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|

|name|string|index: true,null :false|
|description|text|null :false|
|size|string|null :false|
|brand|string|
|state|string|null :false|

|fee_side|string|null :false|
|method|string|null :false|
|region|string|null :false|
|date|string|null :false|

|price|integer|null :false|
|like|integer|

### Association
- belongs_to :user
- has_many :categorys,through: :item_categorys
- has_many :comments
- has_many :photos


##Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|genre|string|null :false|
|subgenre|string|null :false|
|detail|string|null :false|

### Association
- has_many :items,through: :item_categorys


## Item_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|refernces|foreign_key: true|
|category_id|refernces|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


##Brandテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|
|name|string|

### Association
- belongs_to :items


## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|refernces|foreign_key :true|
|user_id|refernces|foreign_key :true|
|text|text|

### Association
- belongs_to :item
- belongs_to :user


## Reviewテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refernces|foreign_key: true|
|rate|integer|

### Association
- belongs_to :user


## Photoテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|refernces|foreign_key: true|

### Association
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
