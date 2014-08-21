require 'rails_helper'

RSpec.describe "categories/edit", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => "MyString",
      :description => "MyText",
      :unit_price => "9.99",
      :unit => "MyString"
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "textarea#category_description[name=?]", "category[description]"

      assert_select "input#category_unit_price[name=?]", "category[unit_price]"

      assert_select "input#category_unit[name=?]", "category[unit]"
    end
  end
end
