require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      lookup_code: "MyString",
      original_url: "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input[name=?]", "link[lookup_code]"

      assert_select "input[name=?]", "link[original_url]"
    end
  end
end
