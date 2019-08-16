require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  #テストユーザー情報
  def setup
    @micropost = microposts(:orange)
  end

  #Micropostsコントローラの認可テスト
  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  #Micropostsコントローラの認可テスト
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end

  #間違ったユーザーによるマイクロポスト削除に対してテストする
  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end
end
