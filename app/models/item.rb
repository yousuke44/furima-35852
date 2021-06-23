class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :comment
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end

    with_options numericality: { greater_than: 299, less_than: 9_999_999 }, format: { with: /\A[0-9]+\z/ } do
      validates :price
    end
  end
end
