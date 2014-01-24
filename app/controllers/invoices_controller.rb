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
  	 	flash[:error] = "Not allowed"
  	 	redirect_to root_path
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
  end

  # GET /invoices/1/edit
  def edit
  	@currencies = Currency.all
  	@clients = @user.clients
  	@invoice_items = Invoice.find_by_slug(params[:id]).invoice_items
  end

  # POST /invoices
  # POST /invoices.json
  def create
   @invoice = Invoice.create(params[:invoice])
   @clients = Client.all
   @currencies = Currency.all
   @user = User.first

    respond_to do |format|
      if @invoice.save
      	InvoiceMailer.send_receipt(@user).deliver
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
    
    def set_user
    	@user = User.find_by_remember_token(cookies[:remember_token])
    end
    
    
    

end
