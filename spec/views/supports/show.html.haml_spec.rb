require 'rails_helper'

RSpec.describe "supports/show", :type => :view do
  before(:each) do
    @support = assign(:support, Support.create!(
      :subject => "Subject",
      :message => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
