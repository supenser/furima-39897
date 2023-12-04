# README

<!-- usersテーブル -->
| Column             | Type   | Options                   |
|                    |        |                           |
| nickname           | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association
has_many :items
has_many :orders


<!-- itemsテーブル -->
| Column           | Type       | Options                       |
|                  |            |                               |
| item             | string     | null: false                   |
| item_text        | text       | null: false                   |
| category_id      | integer    | null: false                   |
| condition_id     | integer    | null: false                   |
| delivery_cost_id | integer    | null: false                   |
| area_id          | integer    | null: false                   |
| shipping_date_id | integer    | null: false                   |
| price            | string     | null: false                   |
| user             | references | null: false,foreign_key: true |

### Association
belongs_to :user
has_one :order


<!-- ordersテーブル -->
| Column  | Type       | Options                       |
|         |            |                               |
| item    | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :address


<!-- addressesテーブル -->
| Column      | Type       | Options                       |
|             |            |                               |
| post        | string     | null: false                   |
| area_id     | integer    | null: false                   |
| area        | string     | null: false                   |
| detail_area | string     | null: false                   |
| building    | string     |                               |
| telephone   | string     | null: false                   |
| order       | references | null: false,foreign_key: true |

### Association
belongs_to :order

