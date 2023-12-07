class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
         VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]{6,}+\z/

        validates :nickname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "が空欄のため入力してください"}
        validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "を○○@○○.○○の形式で入力して下さい" }, length: { maximum: 255 }
        validates :password, presence: true, confirmation: true, format: { with: VALID_PASSWORD_REGEX, message: "を半角英数字6文字以上で入力して下さい" }, length: { maximum: 129 }
        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "に全角文字を使用してください" } do
          validates :last_name
          validates :first_name
        end
        with_options presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "に全角カタカナのみで入力して下さい"} do
          validates :kana_last_name
          validates :kana_first_name
        end
        validates :date_of_birth, presence: true

end
