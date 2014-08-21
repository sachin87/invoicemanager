require 'rails_helper'

RSpec.describe "clients/index", :type => :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
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
      ),
      Client.create!(
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
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Website Url".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
