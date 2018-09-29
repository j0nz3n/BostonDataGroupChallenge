require 'rails_helper'

RSpec.describe "regions/edit", type: :view do
  before(:each) do
    @region = assign(:region, Region.create!(
      :zip_code => "",
      :name => "MyString"
    ))
  end

  it "renders the edit region form" do
    render

    assert_select "form[action=?][method=?]", region_path(@region), "post" do

      assert_select "input[name=?]", "region[zip_code]"

      assert_select "input[name=?]", "region[name]"
    end
  end
end
