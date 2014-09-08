class AccountsController < ApplicationController
  #before_action :set_account, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:new, :create, :index]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account.build_user
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    if @account.valid?
      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch(@account.subdomain)
      @account.save
      redirect_to new_user_session_url(subdomain: @account.subdomain)
    else
      render action: 'new'
    end

    #respond_to do |format|
    #  if @account.save
    #    format.html { redirect_to @account, notice: 'Account was successfully created.' }
    #    format.json { render :show, status: :created, location: @account }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @account.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :description, :subdomain, :image, :image_cache, user_attributes: [:email, :first_name, :last_name, :company, :image, :password, :password_confirmation ])
    end
end
