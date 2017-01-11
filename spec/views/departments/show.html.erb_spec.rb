require 'rails_helper'

RSpec.describe "departments/show", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      :name => "Name",
      :center => nil,
      :chief => "Chief",
      :email => "Email",
      :phone_ext => "Phone Ext"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Chief/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Ext/)
  end
end
