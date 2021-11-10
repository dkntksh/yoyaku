module Batch
  module Service
    class CreateInitialAdminUserService

      # args:params
      #  logger: batch logger
      def initialize(params)
        @params = params
      end

      def execute
        logger.info "#{self.class.name}\##{__method__} execute start ---"
        # 部署 rootの作成
        
        # 管理Userの作成

        # 作成データのログ出力
        logger.info "#{self.class.name}\##{__method__} execute end ---"
      end

      private
      def logger
        @logger ||= @params[:logger]
      end

    end
  end
end