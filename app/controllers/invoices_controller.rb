class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :preview,
                                     :mail, :duplicate, :mark_as_sent, :close]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.invoices.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = current_user.invoices.new
    @invoice.items.build
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = current_user.invoices.new(invoice_params)

    respond_to do |format|
      binding.pry
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.delete!
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
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
    @invoice.mail!
    respond_to do |format|
      format.html { redirect_to invoices_url(@invoice), notice: 'Invoice was Mailed successfully.' }
      format.json { head :no_content }
    end
  end

  def duplicate
    @invoice.duplicate!
    respond_to do |format|
      format.html { redirect_to invoices_url(@invoice), notice: 'Invoice was marked as duplicate.' }
      format.json { head :no_content }
    end
  end

  def close
    @invoice.close!
    respond_to do |format|
      format.html { redirect_to invoices_url(@invoice), notice: 'Invoice was closed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_sent
    @invoice.mark_as_sent!
    respond_to do |format|
      format.html { redirect_to invoices_url(@invoice), notice: 'Invoice was marked as Mailed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = current_user.invoices.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:summary, :date, :invoice_number, :receiver_id, :invoice_due,
                                      :purchase_order_number, :invoice_notes, :id, :receiver_tokens,
                                      items_attributes: [ :invoice_category_tokens, :description, :quantity, :rate, :amount, :date, :link,
                                                          :tag_list, :file, :_destroy, :id ])
    end
end
