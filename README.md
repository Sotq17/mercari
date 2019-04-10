## Userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|intro|text|null :false|
|sales|integer|
|point|integer|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :reviews
- has_many :comments
- has_many :items
- has_one :profile
- has_one :card


## Reviewテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refernces|foreign_key: true|
|item_id|integer|
|rate|integer|

### Association
- belongs_to :user
- belongs_to :item


## Profileテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refernces|foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|phone|integer|null: false, unique: true|
|birth|integer|
|postal_cord|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|


### Association
- belongs_to :user


## Cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refernces|foreign_key: true|
|number|integer|
|expiration|integer|
|cord|integer|


### Association
- belongs_to :user


## Itemテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|brand_id|integer|

|name|string|index: true,null :false|
|description|text|null :false|
|size|string|null :false|
|state|string|null :false|

|fee_side|string|null :false|
|method|string|null :false|
|region|string|null :false|
|date|string|null :false|

|price|integer|null :false|
|like|integer|

### Association
- belongs_to :user
- belongs_to :brand
- has_many :categorys,through: :item_categorys
- has_many :comments
- has_many :photos
- has_one :review

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
- has_many :items


## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|refernces|foreign_key :true|
|user_id|refernces|foreign_key :true|
|text|text|

### Association
- belongs_to :item
- belongs_to :user


## Photoテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|refernces|foreign_key: true|
|image|string|

### Association
- belongs_to :item