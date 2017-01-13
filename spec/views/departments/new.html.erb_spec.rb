require 'rails_helper'

RSpec.describe "departments/new", type: :view do
  before(:each) do
    assign(:department, Department.new(
      :name => "MyString",
      :center => nil,
      :chief => "MyString",
      :email => "MyString",
      :phone_ext => "MyString"
    ))
  end

  it "renders new department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do

      assert_select "input#department_name[name=?]", "department[name]"

      assert_select "input#department_center_id[name=?]", "department[center_id]"

      assert_select "input#department_chief[name=?]", "department[chief]"

      assert_select "input#department_email[name=?]", "department[email]"

      assert_select "input#department_phone_ext[name=?]", "department[phone_ext]"
    end
  end
end
