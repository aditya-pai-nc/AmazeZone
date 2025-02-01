class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_request
  
  # GET /transactions.json
  def index
    if current_user.id != nil
      @transactions = Transaction.where(user_id: current_user.id)
    else
      @transactions = Transaction.all
    end
    render json: @transactions
  end

  # GET /transactions/1.json
  def show
    render json: @transaction
  end

  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.transaction_number = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
    @product = Product.find(params[:transaction][:product_id])
    @transaction.user_id = current_user.id
    @product.quantity = @product.quantity - @transaction.quantity
    @product.save

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1.json
  def update
    if @transaction.update(transaction_params)
      render json: @transaction, status: :ok
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:quantity, :total_cost, :product_id, :credit_card_id)
    end
end
