require 'rails_helper'

RSpec.describe "currencies/new", :type => :view do
  before(:each) do
    assign(:currency, Currency.new(
      :name => "MyString",
      :country_id => 1
    ))
  end

  it "renders new currency form" do
    render

    assert_select "form[action=?][method=?]", currencies_path, "post" do

      assert_select "input#currency_name[name=?]", "currency[name]"

      assert_select "input#currency_country_id[name=?]", "currency[country_id]"
    end
  end
end
