require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        :name => "Name",
        :center => nil,
        :chief => "Chief",
        :email => "Email",
        :phone_ext => "Phone Ext"
      ),
      Department.create!(
        :name => "Name",
        :center => nil,
        :chief => "Chief",
        :email => "Email",
        :phone_ext => "Phone Ext"
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Chief".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Ext".to_s, :count => 2
  end
end
