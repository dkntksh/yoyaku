module Batch
  module Service
    class CreateInitialAdminUserService

      # args:params
      #  logger: batch logger
      def initialize(params)
        @params = params
      end

      def execute
        logger.debug "#{self.class.name}\##{__method__} execute start ---"
        ApplicationRecord.transaction do
          # 部署 rootの作成
          department = Department.new({name: 'root', department_code: '#root'})
          department.save!
          # 管理Userの作成
          admin_user = AdminUser.new({department_id: department.id, name: 'root_admin'})
          admin_user.save!
          password = SecureRandom.hex(4)
          admin_user.set_password(password)
          # 作成データのログ出力
          logger.info "!!!!!----- create admin user! user_name:root_admin password:#{password} -----!!!!!"
        end
        logger.debug "#{self.class.name}\##{__method__} execute end ---"
      rescue ActiveRecord::RecordInvalid => are
        logger.error are.message
        logger.error are.backtrace.join("\n") 
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n") 
      end

      private
      def logger
        @logger ||= @params[:logger]
      end

    end
  end
end