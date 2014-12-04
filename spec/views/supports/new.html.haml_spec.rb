require 'rails_helper'

RSpec.describe "supports/new", :type => :view do
  before(:each) do
    assign(:support, Support.new(
      :subject => "MyString",
      :message => "MyText",
      :user_id => 1
    ))
  end

  it "renders new support form" do
    render

    assert_select "form[action=?][method=?]", supports_path, "post" do

      assert_select "input#support_subject[name=?]", "support[subject]"

      assert_select "textarea#support_message[name=?]", "support[message]"

      assert_select "input#support_user_id[name=?]", "support[user_id]"
    end
  end
end
