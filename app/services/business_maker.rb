class BusinessMaker

  attr_reader :business
  delegate :account_owner, to: :business

  def initialize(business_params=nil, admin=nil)
    @business = Business.new(business_params)
    if admin.present?
      @business.account_owner = admin
    else
      @business.account_owner ||= User.new
    end
  end

  def setup
    if business.account_owner
      business.email = account_owner.email
      business.first_name = account_owner.first_name
    end
    business
  end

  def save
    business.save.tap do |saved|
      if saved
        set_business_user
      end
    end
  end

  def business_id
    @business.id
  end

  def set_business_user
    if account_owner
      business_user = @business.business_users.where(:user_id => account_owner).first_or_initialize.tap do |bu|
        bu.role = "owner"
        bu.email = account_owner.email
        bu.first_name = account_owner.first_name
      end
      business_user.save
    end  
  end


end