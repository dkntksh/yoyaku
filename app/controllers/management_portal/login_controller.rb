class ManagementPortal::LoginController < ApplicationController
  def index
  end

  def login
    name = params[:name]
    admin_user = AdminUser.where(name: name)
    if admin_user.nil?
      @errors = 'ユーザが存在しないか、パスワードが誤っています。'
      redirect index
    end
    password = params[:password]
    unless admin_user.password == Digest::SHA256.hexdigest(password + admin_user.created_at.to_s)
      @errors = 'ユーザが存在しないか、パスワードが誤っています。'
      redirect index
    end

    # ログイン処理

    # home画面へ遷移
  end
end
