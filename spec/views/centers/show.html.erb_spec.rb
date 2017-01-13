require 'rails_helper'

RSpec.describe "centers/show", type: :view do
  before(:each) do
    @center = assign(:center, Center.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
