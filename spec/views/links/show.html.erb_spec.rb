require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      lookup_code: "Lookup Code",
      original_url: "Original Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lookup Code/)
    expect(rendered).to match(/Original Url/)
  end
end
