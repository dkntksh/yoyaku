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
        @logger ||= Batch::BatchLogger.logger('create_initial_admin_user')
      end

    end
  end
end