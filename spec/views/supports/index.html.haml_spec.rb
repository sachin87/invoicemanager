require 'rails_helper'

RSpec.describe "supports/index", :type => :view do
  before(:each) do
    assign(:supports, [
      Support.create!(
        :subject => "Subject",
        :message => "MyText",
        :user_id => 1
      ),
      Support.create!(
        :subject => "Subject",
        :message => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of supports" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
