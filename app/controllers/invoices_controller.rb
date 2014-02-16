class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :edit]

  # GET /invoices
  # GET /invoices.json
  def index
  	 @clients = Client.all
  	 if signed_in? 
  	 	if params[:client_id].nil?
 			 # url /invoices
 		 	 @invoices = @user.invoices
  	 	else
  	 		 # url /clients/:id/invoices
  	 		 @client = Client.find_by_id(params[:client_id])
	 		 @invoices = @client.invoices
 	 		 @single_client = true
  			 if !correct_user?
  			 	flash[:error] = "Not allowed!"
  			 	redirect_to root_path
  			 end
  	 	end
  	 else
  	 	if params[:client_id].nil?
	  	 	flash[:error] = "Not allowed"
  		 	redirect_to root_path
  		 else
  		 	@client = Client.find_by_id(params[:client_id])
  		 	@invoices = @client.invoices
  		 end
  	 end
  	
	 
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  	@user = User.find(@invoice.user_id)
	@client = Client.find_by_id(@invoice.client_id)
	@currency = Currency.find_by_id(@invoice.currency_id)
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
	@clients = @user.clients
	@currencies = Currency.all
	@clients_array = @clients.map { |client| [client.name, client.id] }
	@currencies_array = @currencies.map { |currency| [currency.title, currency.id] }
	@selected_client = params[:client_id]
	
  end

  # GET /invoices/1/edit
  def edit
  	@currencies = Currency.all
  	@clients = @user.clients
  	@invoice_items = Invoice.find_by_slug(params[:id]).invoice_items
  	@clients_array = @clients.map { |client| [client.name, client.id] }
  	@currencies_array = @currencies.map { |currency| [currency.title, currency.id] }
  	@selected_client = @invoice.client_id
  end

  # POST /invoices
  # POST /invoices.json
  def create
   @invoice = Invoice.create(invoice_params)
   @clients = Client.all
   @currencies = Currency.all
   @clients_array = @clients.map { |client| [client.name, client.id] }
   @currencies_array = @currencies.map { |currency| [currency.title, currency.id] }

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
      if @invoice.update(invoice_params)
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
  
  def sendreceipt
  	@invoice = Invoice.find_by_slug(params[:id])
  	InvoiceMailer.send_receipt(@invoice).deliver
  	redirect_to invoice_path(@invoice)
  	flash[:notice] = "Email has been sent!"
  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find_by_slug(params[:id])
    end
    
    def set_user
    	@user = current_user
    end
    
    def invoice_params
    	params.require(:invoice).permit(:project_title, 
    									:client_id, :notes, :slug, :user_id, :invoice_type, 
    									:currency_id, :paid, :discount, 
    									invoice_items_attributes: [:id, :invoice_id, :_destroy, :item_title, :item_desc, :item_amount] )
    end
    

end
