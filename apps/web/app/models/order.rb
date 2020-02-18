class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  before_create :make_payment

  PAYMENT_METHOD_MONEY = '01'
  PAYMENT_METHOD_CARD = '02'

  validates :delivery_address, presence: true
  validates :payment_method, presence: true
  validates :card_number, presence: true, if: :payment_by_card?

  def to_hash
    self.attributes.symbolize_keys
  end

  def show_url_attrs
    serializable_hash(only: [ :id, :menu_id ]).symbolize_keys
  end

  private

  def make_payment
    raise '決済に失敗しました。' if self.card_number == '0000'
    true
  end

  def payment_by_card?
    self.payment_method == PAYMENT_METHOD_CARD
  end
end
