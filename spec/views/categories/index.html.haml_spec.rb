require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :name => "Name",
        :description => "MyText",
        :unit_price => "9.99",
        :unit => "Unit"
      ),
      Category.create!(
        :name => "Name",
        :description => "MyText",
        :unit_price => "9.99",
        :unit => "Unit"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
  end
end
