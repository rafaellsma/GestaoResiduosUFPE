require 'rails_helper'

RSpec.describe "centers/edit", type: :view do
  before(:each) do
    @center = assign(:center, Center.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit center form" do
    render

    assert_select "form[action=?][method=?]", center_path(@center), "post" do

      assert_select "input#center_name[name=?]", "center[name]"
    end
  end
end
