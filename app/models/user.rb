class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :date_of_birth

    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'Please enter your name in full-width' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'Please enter your name in full-width' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'contain both letters and nembers'
end
