require 'rails_helper'

RSpec.describe "centers/index", type: :view do
  before(:each) do
    assign(:centers, [
      Center.create!(
        :name => "Name"
      ),
      Center.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of centers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
