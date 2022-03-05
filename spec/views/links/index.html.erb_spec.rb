require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        lookup_code: "Lookup Code",
        original_url: "Original Url"
      ),
      Link.create!(
        lookup_code: "Lookup Code",
        original_url: "Original Url"
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", text: "Lookup Code".to_s, count: 2
    assert_select "tr>td", text: "Original Url".to_s, count: 2
  end
end
