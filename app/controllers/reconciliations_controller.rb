class ReconciliationsController < ApplicationController
  # before_action :set_reconciliation, only: [:show, :edit, :update, :destroy]
  before_action :set_account

  # GET /reconciliations
  # GET /reconciliations.json
  def index
    @reconciliations = Reconciliation.where(account: @account)
  end

  # GET /reconciliations/1
  # GET /reconciliations/1.json
  # def show
  # end

  # GET /reconciliations/new
  def new
    @reconciliation = Reconciliation.new(account: @account)
  end

  # # GET /reconciliations/1/edit
  # def edit
  # end

  # POST /reconciliations
  # POST /reconciliations.json
  def create
    @reconciliation = Reconciliation.new(reconciliation_params)

    respond_to do |format|
      if @reconciliation.save
        format.html { redirect_to account_reconciliations_path(@account), notice: 'Reconciliation was successfully created.' }
        # format.json { render :show, status: :created, location: @reconciliation }
      else
        format.html { render :new }
        # format.json { render json: @reconciliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reconciliations/1
  # PATCH/PUT /reconciliations/1.json
  # def update
  #   respond_to do |format|
  #     if @reconciliation.update(reconciliation_params)
  #       format.html { redirect_to @reconciliation, notice: 'Reconciliation was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @reconciliation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @reconciliation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /reconciliations/1
  # DELETE /reconciliations/1.json
  # def destroy
  #   @reconciliation.destroy
  #   respond_to do |format|
  #     format.html { redirect_to reconciliations_url, notice: 'Reconciliation was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_account
      @account = Account.find(params[:account_id])
    end

    # def set_reconciliation
    #   @reconciliation = Reconciliation.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reconciliation_params
      params.require(:reconciliation).permit(:new_balance, :notes, :account_id)
    end
end
