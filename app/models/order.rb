class Order < ApplicationRecord
  belongs_to :user
  has_one :product_list

  validates :billing_name, presence: true
  # validates :billing_address, presence: true
  # validates :shipping_name, presence: true
  # validates :shipping_address, presence: true
  validates :assured, presence: true

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  # def add_product_to_order(product)
  #   product_list = self.build_product_lists
  #   product_list.product_name = cart_item.product.title
  #   product_list.product_price = cart_item.product.price
  #   product_list.quantity = 1
  #   product_list.save
  # end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    # But nothing is paid
    self.update_columns(is_paid: true)
  end

  scope :recent, -> { order("created_at DESC") }

  include AASM

  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :order_cancelled
    state :good_returned

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :deliver do
      transitions from: :shipping, to: :shipped
    end

    event :return_good do
      transitions from: :shipped, to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end

end
