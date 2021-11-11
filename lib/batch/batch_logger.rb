# 初期管理ユーザ作成バッチ
module Batch
  module BatchLogger
 
    class << self
      delegate(
        :debug,
        :info,
        :warn,
        :error,
        :fatal,
        to: :logger
      )
  
      def logger(file_name)
        @logger ||= begin
          # (1) 専用のログファイル出力用の Logger オブジェクトを作成する。
          logger = ActiveSupport::Logger.new(Rails.root.join('log/batch', file_name + '.log'), 'daily')
          logger.formatter = Logger::Formatter.new
          logger.datetime_format = '%Y-%m-%d %H:%M:%S'
  
          # (2) 標準出力用の Logger オブジェクトを作成する。
          srdout_logger = ActiveSupport::Logger.new(STDOUT)
          # (3) 複数のログを出力する機能を備えた Module オブジェクトを作成する。
          multiple_loggers =
           ActiveSupport::Logger.broadcast(srdout_logger)
          # (4) (3) で作成した Module オブジェクトを (1) に extend する。
          logger.extend(multiple_loggers)
  
          logger
        end
      end
    end

  end
end
