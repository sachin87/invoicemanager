require 'rails_helper'

RSpec.describe "clients/show", :type => :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :currency_id => 1,
      :email => "Email",
      :phone => "Phone",
      :website_url => "Website Url",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
      :country_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Website Url/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/2/)
  end
end
