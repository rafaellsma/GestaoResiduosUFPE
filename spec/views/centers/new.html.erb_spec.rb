require 'rails_helper'

RSpec.describe "centers/new", type: :view do
  before(:each) do
    assign(:center, Center.new(
      :name => "MyString"
    ))
  end

  it "renders new center form" do
    render

    assert_select "form[action=?][method=?]", centers_path, "post" do

      assert_select "input#center_name[name=?]", "center[name]"
    end
  end
end
