class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
  	 @clients = Client.all
  	 if params[:client_id].nil?
  	 	user = User.find_by_remember_token(cookies[:remember_token])
  	 	 @invoices = user.invoices
	 else
	 	 @invoices = Client.find_by_id(params[:client_id]).invoices
	 end
	 
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  	@invoice = Invoice.find_by_slug(params[:id])
	@client = Client.find_by_id(Invoice.find_by_slug(params[:id]).client_id)
	@user = User.find(@invoice.user_id)
  	
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
    user = User.find_by_remember_token(cookies[:remember_token])
	@clients = user.clients
  end

  # GET /invoices/1/edit
  def edit
  	@clients = Client.all
  	@invoice_items = Invoice.find_by_slug(params[:id]).invoice_items
  end

  # POST /invoices
  # POST /invoices.json
  def create
   @invoice = Invoice.create(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find_by_slug(params[:id])
    end

#    # Never trust parameters from the scary internet, only allow the white list through.
#    def invoice_params
#      params.require(:invoice).permit(:project_title, :client_id, :notes)
#    end
    

end
