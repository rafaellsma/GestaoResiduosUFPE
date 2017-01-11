require 'rails_helper'

RSpec.describe "laboratories/index", type: :view do
  before(:each) do
    assign(:laboratories, [
      Laboratory.create!(
        :name => "Name",
        :user => nil
      ),
      Laboratory.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of laboratories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
