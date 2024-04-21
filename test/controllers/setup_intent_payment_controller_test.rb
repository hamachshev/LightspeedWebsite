require "test_helper"

class SetupIntentPaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get setup_intent_payment_create_url
    assert_response :success
  end
end
