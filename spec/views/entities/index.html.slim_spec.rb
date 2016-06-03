require 'rails_helper'

RSpec.describe "entities/index", type: :view do
  before(:each) do
    assign(:entities, [
      Entity.create!(
        :parent_id => 1,
        :sort_order => 2,
        :kind_num => 3,
        :name => "Name",
        :desc => "MyText",
        :deps => ""
      ),
      Entity.create!(
        :parent_id => 1,
        :sort_order => 2,
        :kind_num => 3,
        :name => "Name",
        :desc => "MyText",
        :deps => ""
      )
    ])
  end

  it "renders a list of entities" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
