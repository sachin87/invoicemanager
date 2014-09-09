require 'rails_helper'

RSpec.describe "currencies/index", :type => :view do
  before(:each) do
    assign(:currencies, [
      Currency.create!(
        :name => "Name",
        :country_id => 1
      ),
      Currency.create!(
        :name => "Name",
        :country_id => 1
      )
    ])
  end

  it "renders a list of currencies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
