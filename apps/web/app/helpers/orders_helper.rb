module OrdersHelper
  def payment_method_options
    [Order::PAYMENT_METHOD_MONEY, Order::PAYMENT_METHOD_CARD]. map do |it|
      [t("views.orders.payment_method.#{it}"), it]
    end
  end
end
