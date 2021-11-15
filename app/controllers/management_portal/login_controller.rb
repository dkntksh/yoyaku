class ManagementPortal::LoginController < ApplicationController
  def index
  end

  def login
    name = login_params[:name]
    admin_user = AdminUser.where(name: name)

    # パスワードの認証
    if admin_user.present? 
      if admin_user.authenticate(login_params[:password])
        session[:admin_user_id] = admin_user.id
        session[:admin_user_name] = admin_user.name
      else
        admin_user.error
        @error = 'ユーザが存在しないか、パスワードが誤っています。'
        render :index
      end
    else
      @error = 'ユーザが存在しないか、パスワードが誤っています。'
      render :index
    end

    # ログイン処理

    # home画面へ遷移
    redirect_to home
  end

  def login_params
    params.require(:admin_user).permit(:name, :password)
  end
end
