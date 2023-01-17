class SavingsController < ApplicationController
  before_action :logged_in_user
  before_action :set_saving, only: %i[ show edit update destroy ]

  # GET /savings or /savings.json
  def index
    @year = Date.today.year
    @month = Date.today.month
    datefi = Date.new(@year.to_i, @month.to_i, 1)
    datela = datefi.end_of_month
    @savings = Saving.where('account_id = ? AND income_pay_date between ? and ?', current_user.id, datefi, datela).order(income_pay_date: :asc)
    @balance = Saving.cal_balance(current_user.id) 
    @message = Saving.message_by_balance(@balance)
  end

  def search
    @year =  params[:search][:year]
    @month = params[:search][:month]
    if @year.present? && @month.present?
      datefi = Date.new(@year.to_i, @month.to_i, 1)
      datela = datefi.end_of_month
    end

    @savings = Saving.where('account_id = ? AND income_pay_date between ? and ?', current_user.id, datefi, datela).order(income_pay_date: :asc)
    @balance = Saving.cal_balance(current_user.id) 
    @message = Saving.message_by_balance(@balance)

    #@savings = Saving.where('account_id: current_user.id').order(income_pay_date: :asc)
    #@savings = Saving.where('income_pay_date between ? and ?', datefi, datela)

    render :index
  end

  # GET /savings/1 or /savings/1.json
  def show
  end

  # GET /savings/new
  def new
    @saving = Saving.new
  end

  # GET /savings/1/edit
  def edit
  end

  # POST /savings or /savings.json
  def create
    @saving = Saving.new(saving_params)
    @saving.account_id = current_user.id
    respond_to do |format|
      if @saving.save
        format.html { redirect_to saving_url(@saving), notice: "作成が完了しました。" }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings/1 or /savings/1.json
  def update
    respond_to do |format|
      if @saving.update(saving_params)
        format.html { redirect_to saving_url(@saving), notice: "編集が完了しました。" }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1 or /savings/1.json
  def destroy
    @saving.destroy

    respond_to do |format|
      format.html { redirect_to savings_url, notice: "削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving
      @saving = Saving.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saving_params
      params.require(:saving).permit(:account_id, :income_pay_date, :pay, :income, :comment)
    end
end
