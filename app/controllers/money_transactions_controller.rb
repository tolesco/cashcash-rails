class MoneyTransactionsController < ApplicationController
  include Pagy::Backend
  before_action :set_money_transaction, only: [:edit, :update, :destroy]

  # GET /money_transactions
  def index
    @account  = Account.where(id: params[:account]).first
    @category = Category.where(id: params[:category]).first
    records   = MoneyTransaction.find_by_filters(current_user, params[:search], params[:account], params[:category], params[:date_range])
    respond_to do |format|
      format.html{ @pagy, @money_transactions = pagy(records, items: 10) }
      format.csv { send_data MoneyTransaction.to_csv(records), filename: "cashcash-transactions-#{Date.today}.csv" }
    end
  end

  # GET /money_transactions/new
  def new
    @money_transaction = MoneyTransaction.new(kind: 'deposit')
    set_accounts
    set_money_transaction_kinds
    set_categories
  end

  # GET /money_transactions/1/edit
  def edit
    set_accounts
    set_money_transaction_kinds
    set_categories
  end

  # POST /money_transactions
  def create
    @money_transaction = MoneyTransaction.new(money_transaction_params)
    if @money_transaction.save
      redirect_to money_transactions_url, notice: 'Money transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /money_transactions/1
  def update    
    if @money_transaction.update(money_transaction_params)
      redirect_to money_transactions_url, notice: 'Money transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /money_transactions/1
  def destroy
    @money_transaction.destroy
    redirect_to money_transactions_url, notice: 'Money transaction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_transaction
      @money_transaction = MoneyTransaction.find(params[:id])
    end

    def set_accounts
      @accounts = current_user.accounts.kept.map{ |a| [a.name, a.id] }
    end

    def set_money_transaction_kinds
      @money_transaction_kinds = MoneyTransaction.kinds.map{ |mt| [mt[0].humanize, mt[0]]}
    end

    def set_categories
      @categories = Category.by_money_transaction_kind(current_user, @money_transaction.kind).map{ |c| [c.name, c.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_transaction_params
      params.require(:money_transaction).permit(:description, :done_at, :kind, :amount, :notes, :cfdi_folio, :cfdi_issued_by, :cfdi_issued_rfc, :cfdi_payment_method, :account_id, :category_id, :invoice, :cfdi_pdf, :cfdi_xml)
    end
end
