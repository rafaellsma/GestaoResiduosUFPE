require 'rails_helper'

RSpec.describe "sediments/index", type: :view do
  before(:each) do
    assign(:sediments, [
      Sediment.create!(
        :composition => "Composition",
        :weight => "9.99",
        :local => "Local"
      ),
      Sediment.create!(
        :composition => "Composition",
        :weight => "9.99",
        :local => "Local"
      )
    ])
  end

  it "renders a list of sediments" do
    render
    assert_select "tr>td", :text => "Composition".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Local".to_s, :count => 2
  end
end
