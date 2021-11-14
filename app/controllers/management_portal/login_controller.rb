class ManagementPortal::LoginController < ApplicationController
  def index
  end

  def login
    name = login_params[:name]
    admin_user = AdminUser.where(name: name)

    # パスワードの認証
    if admin_user.present? && admin_user.authenticate(login_params[:password])
      session[:user_id] = admin_user.id
      session[:user_name] = admin_user.name
    else
      @error = 'ユーザが存在しないか、パスワードが誤っています。'
      render :index
    end

    # ログイン処理

    # home画面へ遷移
  end

  def login_params
    params.require(:admin_user).permit(:name, :password)
  end
end
