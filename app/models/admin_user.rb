class AdminUser < ApplicationRecord

  # 引数のパスワードをhash化して、パスワードとして設定する
  def set_password(arg_password)
    self.password = Digest::SHA256.hexdigest(arg_password + self.created_at.to_s)
    self.save!
  end


end
