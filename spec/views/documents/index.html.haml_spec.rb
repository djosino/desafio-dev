require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    assign(:documents, [
      Document.create!(
        user: nil
      ),
      Document.create!(
        user: nil
      )
    ])
  end

  it "renders a list of documents" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
