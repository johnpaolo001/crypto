require 'test_helper'

class CryptolistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cryptolist = cryptolists(:one)
  end

  test "should get index" do
    get cryptolists_url
    assert_response :success
  end

  test "should get new" do
    get new_cryptolist_url
    assert_response :success
  end

  test "should create cryptolist" do
    assert_difference('Cryptolist.count') do
      post cryptolists_url, params: { cryptolist: { amount_owned: @cryptolist.amount_owned, cost_per: @cryptolist.cost_per, symbol: @cryptolist.symbol, user_id: @cryptolist.user_id } }
    end

    assert_redirected_to cryptolist_url(Cryptolist.last)
  end

  test "should show cryptolist" do
    get cryptolist_url(@cryptolist)
    assert_response :success
  end

  test "should get edit" do
    get edit_cryptolist_url(@cryptolist)
    assert_response :success
  end

  test "should update cryptolist" do
    patch cryptolist_url(@cryptolist), params: { cryptolist: { amount_owned: @cryptolist.amount_owned, cost_per: @cryptolist.cost_per, symbol: @cryptolist.symbol, user_id: @cryptolist.user_id } }
    assert_redirected_to cryptolist_url(@cryptolist)
  end

  test "should destroy cryptolist" do
    assert_difference('Cryptolist.count', -1) do
      delete cryptolist_url(@cryptolist)
    end

    assert_redirected_to cryptolists_url
  end
end
