class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy, :preview,
                                  :mail, :duplicate, :mark_as_sent, :close]

  # GET /bills
  # GET /bills.json
  def index
    @bills = current_user.bills.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = current_user.bills.new
    @bill.items.build
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = current_user.bills.new(bill_params)
    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview
    respond_to do |format|
      format.pdf do
        render :pdf => 'index'
      end
    end
  end

  def mail
    @bill.mail!
    respond_to do |format|
      format.html { redirect_to bills_url(@bill), notice: 'Bill was Mailed successfully.' }
      format.json { head :no_content }
    end
  end

  def duplicate
    @bill.duplicate!
    respond_to do |format|
      format.html { redirect_to bills_url(@bill), notice: 'Bill was marked as duplicate.' }
      format.json { head :no_content }
    end
  end

  def close
    @bill.close!
    respond_to do |format|
      format.html { redirect_to bills_url(@bill), notice: 'Bill was closed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_sent
    @bill.mark_as_sent!
    respond_to do |format|
      format.html { redirect_to bills_url(@bill), notice: 'Bill was marked as Mailed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = current_user.bills.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:summary, :receiver_tokens, :date, :bill_number, :due_on, :bill_reference_number,
                                   :bill_notes, :id, items_attributes: [ :bill_category_tokens, :quantity,
                                   :rate, :amount, :_destroy, :id ])
    end

end
