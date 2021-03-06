class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :dude_where_is_my_cart?, only: [:show]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])
    @line_item = LineItem.where(cart_id: params[:id])

    @total = 0
    @line_item.each do |line|
      @total += line.subtotal
    end
    @totalStripe = @total * 100
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end

    def dude_where_is_my_cart?
      if current_user.nil?
        redirect_to new_user_session_path, notice: "Tu n'est pas connecté coco!"
      elsif @cart.nil? || current_user.cart.id !=@cart.id
        redirect_to root_path, notice: "C'est pas ton panier! T'essayes de voir les chattes de la voisine?"
      end
    end
end
