class FoodsController < ApplicationController
  before_action :logged_in_user
  before_action :set_food, only: %i[ show edit syouhi update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.where(["user_id = ? and quantity > 0", current_user.id]).order(expiration_date: :asc)
  end

  def search
    @category_id =  params[:search][:category_id]
    @zeroflag = params[:search][:zeroflag]

    where_zero = " and quantity > 0"
    if @zeroflag
      where_zero =""
    end

    if @category_id.present?
      @foods = Food.where(["user_id = ? and category_id = ?" + where_zero, current_user.id, @category_id]).order(expiration_date: :asc)
    else
      @foods = Food.where(["user_id = ?" + where_zero, current_user.id]).order(expiration_date: :asc)
    end

  render :index
  end

  # GET /foods/1 or /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  def syouhi
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "" }
        format.json { render :show, status: :ok, location: @food }
      else
        if @food.consumption?
          format.html { render :syouhi, status: :unprocessable_entity }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:user_id, :food_name, :category_id, :syoumi_syouhi, :expiration_date, :purchase_date, :quantity, :consumption, :consumption_how)
    end
end
