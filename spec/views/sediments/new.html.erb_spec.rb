require 'rails_helper'

RSpec.describe "sediments/new", type: :view do
  before(:each) do
    assign(:sediment, Sediment.new(
      :composition => "MyString",
      :weight => "9.99",
      :local => "MyString"
    ))
  end

  it "renders new sediment form" do
    render

    assert_select "form[action=?][method=?]", sediments_path, "post" do

      assert_select "input#sediment_composition[name=?]", "sediment[composition]"

      assert_select "input#sediment_weight[name=?]", "sediment[weight]"

      assert_select "input#sediment_local[name=?]", "sediment[local]"
    end
  end
end
