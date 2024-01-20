require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "YWAM Social", full_title
    assert_equal "Help | YWAM Social", full_title("Help")
  end
end