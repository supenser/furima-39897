class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]{6,}+\z/

        validates :nickname, presence: true
        validates :password, confirmation: true, format: { with: VALID_PASSWORD_REGEX }
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
          validates :last_name
          validates :first_name
        end
        with_options presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
          validates :kana_last_name
          validates :kana_first_name
        end
        validates :date_of_birth, presence: true
        has_many :items
end
