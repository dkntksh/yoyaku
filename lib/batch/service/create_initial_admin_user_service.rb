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
        # 部署 rootの作成
        department = Department.new({name: 'root', department_code: '#root'})
        department.save!
        # 管理Userの作成
        admin_user = AdminUser.new({department_id: department.id, name: 'root_admin'})
        admin_user.save!
        password = SecureRandom.hex(4)
        admin_user.set_password(password)
        logger.info "!!!!!----- create admin user! user_name:root_admin password:#{password} -----!!!!!"
        # 作成データのログ出力
        logger.debug "#{self.class.name}\##{__method__} execute end ---"
      end

      private
      def logger
        @logger ||= @params[:logger]
      end

    end
  end
end