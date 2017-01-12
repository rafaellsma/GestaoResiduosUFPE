require 'rails_helper'

RSpec.describe "sediments/show", type: :view do
  before(:each) do
    @sediment = assign(:sediment, Sediment.create!(
      :composition => "Composition",
      :weight => "9.99",
      :local => "Local"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Composition/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Local/)
  end
end
