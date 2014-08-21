require 'rails_helper'

RSpec.describe "clients/edit", :type => :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :currency_id => 1,
      :email => "MyString",
      :phone => "MyString",
      :website_url => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :country_id => 1
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input#client_first_name[name=?]", "client[first_name]"

      assert_select "input#client_last_name[name=?]", "client[last_name]"

      assert_select "input#client_currency_id[name=?]", "client[currency_id]"

      assert_select "input#client_email[name=?]", "client[email]"

      assert_select "input#client_phone[name=?]", "client[phone]"

      assert_select "input#client_website_url[name=?]", "client[website_url]"

      assert_select "input#client_street_address[name=?]", "client[street_address]"

      assert_select "input#client_city[name=?]", "client[city]"

      assert_select "input#client_state[name=?]", "client[state]"

      assert_select "input#client_zipcode[name=?]", "client[zipcode]"

      assert_select "input#client_country_id[name=?]", "client[country_id]"
    end
  end
end
