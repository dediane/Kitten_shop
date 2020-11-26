class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
 
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit

  end

  # POST /line_items
  # POST /line_items.json
  def create
    @item = Item.find(params[:item_id])
    @cart = Cart.where(user_id: current_user.id)
    @line_item_cart = LineItem.where(cart_id: @cart.ids.last)
    @found = false
    @line_item_cart.each do |line|
      if line.item_id == @item.id
        line.quantity += 1
        line.subtotal += @item.price
        line.save
        @found = true
      end
    end

    if @found == false
      @line_item = LineItem.new(item_id: @item.id, cart_id: @cart.ids.last, quantity: 1, subtotal: @item.price)
      @line_item.save
    end

    respond_to do |format|
      format.html { redirect_to user_cart_path(id: @cart.ids.last, user_id:current_user.id), notice: 'Tu as ajouté un nouveau chat!' }
      format.json { render :show, status: :created, location: @line_item }
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @cart = Cart.where(user_id: current_user.id)
    @line_item.quantity = params[:quantity]
    @line_item.subtotal = params[:quantity].to_i * @line_item.item.price
    @line_item.save
    respond_to do |format|
        format.html { redirect_to user_cart_path(id: @cart.ids.last, user_id:current_user.id), notice: 'Votre panier à éte mis à jour' }
        format.json { render :show, status: :ok, location: @line_item }
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    @cart = Cart.where(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to user_cart_path(id: @cart.ids.last, user_id:current_user.id), notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def line_item_params
    #   params.require(:line_item).permit(:cart_id, :order_id)
    # end
end
