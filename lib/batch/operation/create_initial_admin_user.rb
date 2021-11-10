module Batch
  module Operation
    # require 'batch/service/create_initial_admin_user_service'
    # 初期管理ユーザ作成バッチ
    class CreateInitialAdminUser
      def execute
        logger.info "--- start ---"
        execute!
        logger.info "--- end ---"
      end

      private 
      def execute!
        params = {:logger => logger}
        Batch::Service::CreateInitialAdminUserService.new(params).execute
      end

      def logger
        @logger ||= Logger.new('log/batch/create_inital_admin_user.log')
      end

    end
  end
end