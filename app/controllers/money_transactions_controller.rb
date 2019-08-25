class MoneyTransactionsController < ApplicationController
  before_action :set_money_transaction, only: [:edit, :update, :destroy]

  # GET /money_transactions
  # GET /money_transactions.json
  def index
    @money_transactions = MoneyTransaction.joins(:account).where('accounts.user_id = ?', current_user)
  end

  # GET /money_transactions/1
  # GET /money_transactions/1.json
  # def show
  # end

  # GET /money_transactions/new
  def new
    @money_transaction = MoneyTransaction.new
  end

  # GET /money_transactions/1/edit
  def edit
  end

  # POST /money_transactions
  # POST /money_transactions.json
  def create
    @money_transaction = MoneyTransaction.new(money_transaction_params)

    respond_to do |format|
      if @money_transaction.save
        format.html { redirect_to money_transactions_url, notice: 'Money transaction was successfully created.' }
        # format.json { render :show, status: :created, location: @money_transaction }
      else
        format.html { render :new }
        # format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money_transactions/1
  # PATCH/PUT /money_transactions/1.json
  def update
    respond_to do |format|
      if @money_transaction.update(money_transaction_params)
        format.html { redirect_to money_transactions_url, notice: 'Money transaction was successfully updated.' }
        # format.json { render :show, status: :ok, location: @money_transaction }
      else
        format.html { render :edit }
        # format.json { render json: @money_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_transactions/1
  # DELETE /money_transactions/1.json
  def destroy
    @money_transaction.destroy
    respond_to do |format|
      format.html { redirect_to money_transactions_url, notice: 'Money transaction was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_transaction
      @money_transaction = MoneyTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_transaction_params
      params.require(:money_transaction).permit(:description, :done_at, :kind, :amount, :notes, :cfdi_folio, :cfdi_issued_by, :cfdi_issued_rfc, :cfdi_payment_method, :data, :account_id, :category_id)
    end
end
