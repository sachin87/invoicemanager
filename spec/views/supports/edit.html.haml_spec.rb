require 'rails_helper'

RSpec.describe "supports/edit", :type => :view do
  before(:each) do
    @support = assign(:support, Support.create!(
      :subject => "MyString",
      :message => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit support form" do
    render

    assert_select "form[action=?][method=?]", support_path(@support), "post" do

      assert_select "input#support_subject[name=?]", "support[subject]"

      assert_select "textarea#support_message[name=?]", "support[message]"

      assert_select "input#support_user_id[name=?]", "support[user_id]"
    end
  end
end
