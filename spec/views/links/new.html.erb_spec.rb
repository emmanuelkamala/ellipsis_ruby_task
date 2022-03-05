require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      lookup_code: "MyString",
      original_url: "MyString"
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input[name=?]", "link[lookup_code]"

      assert_select "input[name=?]", "link[original_url]"
    end
  end
end
