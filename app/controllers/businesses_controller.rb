class BusinessesController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:new, :create]
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  
  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = BusinessMaker.new(nil,current_user).business
  end

  def edit
  end

  def create
    bparams = params.require(:business).permit(:business_name, :is_organization, account_owner_attributes: [:first_name, :email, :password])
    bm = BusinessMaker.new(bparams,current_user)
    @business = bm.setup
    
    respond_to do |format|
      if bm.save
        sign_in(:user, bm.account_owner, force: true)
        session[:business_id] = bm.business_id
        format.html { redirect_to dashboard_index_path, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, errors: "not create" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to edit_business_path(@business), notice: 'Connection has been successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:first_name, :last_name, :phone, :mobile, :fax, :website, :address,
                                       :city, :state, :zipcode, :email, :business_name, :is_organization)
    end
end
