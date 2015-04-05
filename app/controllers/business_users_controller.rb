class BusinessUsersController < ApplicationController
  before_action :set_business_user, only: [:show, :edit, :update, :destroy]

  def index
    @business_users = BusinessUser.all
  end

  def show
  end

  def new
    @business_user = BusinessUser.new
  end

  def edit
  end

  def create
    @business_user = BusinessUser.new(business_user_params)

    respond_to do |format|
      if @business_user.save
        format.html { redirect_to @business_user, notice: 'Business user was successfully created.' }
        format.json { render :show, status: :created, location: @business_user }
      else
        format.html { render :new }
        format.json { render json: @business_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business_user.update(business_user_params)
        format.html { redirect_to @business_user, notice: 'Business user was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_user }
      else
        format.html { render :edit }
        format.json { render json: @business_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business_user.destroy
    respond_to do |format|
      format.html { redirect_to business_users_url, notice: 'Business user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_user
      @business_user = BusinessUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_user_params
      params[:business_user]
    end
end
