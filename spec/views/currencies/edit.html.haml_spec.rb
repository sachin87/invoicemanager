require 'rails_helper'

RSpec.describe "currencies/edit", :type => :view do
  before(:each) do
    @currency = assign(:currency, Currency.create!(
      :name => "MyString",
      :country_id => 1
    ))
  end

  it "renders the edit currency form" do
    render

    assert_select "form[action=?][method=?]", currency_path(@currency), "post" do

      assert_select "input#currency_name[name=?]", "currency[name]"

      assert_select "input#currency_country_id[name=?]", "currency[country_id]"
    end
  end
end
