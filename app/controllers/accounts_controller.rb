class AccountsController < ApplicationController
  before_action :set_account, only: [:edit, :update, :unarchive, :destroy]

  # GET /accounts
  def index
    if params[:archived].present?
      @accounts = current_user.accounts.discarded
    else
      @accounts = current_user.accounts.kept
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new(user: current_user)
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_url, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to accounts_url, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # PATCH/PUT /accounts/1/unarchive
  def unarchive
    @account.undiscard
    redirect_to accounts_url, notice: 'Account was successfully recovered'
  end

  # DELETE /accounts/1
  def destroy
    @account.discard
    redirect_to accounts_url, notice: 'Account removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:kind, :name, :initial_balance, :current_balance, :description, :user_id)
    end
end
