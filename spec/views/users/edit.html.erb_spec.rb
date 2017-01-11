require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :phone_ext => "MyString",
      :email => "MyString",
      :password => "MyString",
      :admin => false,
      :laboratory => nil
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_phone_ext[name=?]", "user[phone_ext]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_admin[name=?]", "user[admin]"

      assert_select "input#user_laboratory_id[name=?]", "user[laboratory_id]"
    end
  end
end
