require 'rails_helper'

RSpec.describe "departments/edit", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      :name => "MyString",
      :center => nil,
      :chief => "MyString",
      :email => "MyString",
      :phone_ext => "MyString"
    ))
  end

  it "renders the edit department form" do
    render

    assert_select "form[action=?][method=?]", department_path(@department), "post" do

      assert_select "input#department_name[name=?]", "department[name]"

      assert_select "input#department_center_id[name=?]", "department[center_id]"

      assert_select "input#department_chief[name=?]", "department[chief]"

      assert_select "input#department_email[name=?]", "department[email]"

      assert_select "input#department_phone_ext[name=?]", "department[phone_ext]"
    end
  end
end
