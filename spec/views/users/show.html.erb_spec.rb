require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :phone_ext => "Phone Ext",
      :email => "Email",
      :password => "Password",
      :admin => false,
      :laboratory => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone Ext/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
