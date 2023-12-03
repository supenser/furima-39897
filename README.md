# README

<!-- usersテーブル -->
| Column        | Type   | Options              |
|               |        |                      |
| nickname      | string | null: false          |
| email         | string | null: false , UNIQUE |
| password      | string | null: false          |
| name          | string | null: false          |
| kana_name     | string | null: false          |
| date_of_birth | string | null: false          |

### Association
has_many :items
has_many :orders


<!-- itemsテーブル -->
| Column           | Type       | Options                       |
|                  |            |                               |
| item             | string     | null: false                   |
| category_id      | references | null: false,foreign_key: true |
| condition_id     | references | null: false,foreign_key: true |
| delivery_cost_id | references | null: false,foreign_key: true |
| area_id          | references | null: false,foreign_key: true |
| shipping_date_id | references | null: false,foreign_key: true |
| price            | string     | null: false                   |
| user_id          | references | null: false,foreign_key: true |

### Association
belongs_to :users
has_one :orders


<!-- ordersテーブル -->
| Column  | Type       | Options                       |
|         |            |                               |
| item_id | references | null: false,foreign_key: true |
| user_id | references | null: false,foreign_key: true |

### Association
belongs_to :items
belongs_to :users
has_one :addresses


<!-- addressesテーブル -->
| Column      | Type       | Options                       |
|             |            |                               |
| post        | string     | null: false                   |
| address_id  | references | null: false,foreign_key: true |
| area        | string     | null: false                   |
| detail_area | string     | null: false                   |
| building    | string     |                               |
| telephone   | string     | null: false                   |
| order_id    | references | null: false,foreign_key: true |

### Association
belongs_to :orders