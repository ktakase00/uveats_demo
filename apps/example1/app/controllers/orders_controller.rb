class OrdersController < ApplicationController
  before_action :check_login
  before_action :set_order_query_form, only: [:new, :create, :show]
  before_action :set_menu, only: [:new, :create, :show]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_path(@order.show_url_attrs), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      # ↓↓↓ここにコードを追加する↓↓↓
      params.require(:order).permit(
        :delivery_address,
        :payment_method,
        :card_number,
      ).merge({
        menu_id: params[:menu_id]
      }).merge({
        user_id: @me.id
      })
      # ↑↑↑↑↑↑
    end

    def menu_params
      params.permit(:menu_id)
    end

    def set_order_query_form
      @order_query_form = OrderQueryForm.new(menu_params)

      if @order_query_form.invalid?
        redirect_to menus_path, { notice: @order_query_form.errors.full_messages }
      end
    end

    def set_menu
      @menu = Menu.find_by(@order_query_form.menu_attrs)
    end
end
