class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  def index
    @categories = current_user.categories
  end

  # GET /categories/new
  def new
    @category = Category.new(user: current_user)
    set_associated_transaction_types
  end

  # GET /categories/1/edit
  def edit
    set_associated_transaction_types
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    if @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    else
      redirect_to categories_url, alert: 'This category cannot be removed.'      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def set_associated_transaction_types
      @associated_transaction_types = Category.associated_transaction_types.map{ |tt| [tt[0].humanize, tt[0]] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:associated_transaction_type, :name, :description, :user_id)
    end
end
