require 'batch/operation/create_initial_admin_user'

namespace :batch do
  desc '初期管理ユーザ作成'
  task create_initial_admin_user: :environment do
    Batch::Operation::CreateInitialAdminUser.new.execute
  end
end 