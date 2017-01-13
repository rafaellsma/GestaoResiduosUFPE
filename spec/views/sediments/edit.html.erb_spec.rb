require 'rails_helper'

RSpec.describe "sediments/edit", type: :view do
  before(:each) do
    @sediment = assign(:sediment, Sediment.create!(
      :composition => "MyString",
      :weight => "9.99",
      :local => "MyString"
    ))
  end

  it "renders the edit sediment form" do
    render

    assert_select "form[action=?][method=?]", sediment_path(@sediment), "post" do

      assert_select "input#sediment_composition[name=?]", "sediment[composition]"

      assert_select "input#sediment_weight[name=?]", "sediment[weight]"

      assert_select "input#sediment_local[name=?]", "sediment[local]"
    end
  end
end
