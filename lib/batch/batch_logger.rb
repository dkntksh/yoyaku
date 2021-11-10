# 初期管理ユーザ作成バッチ
class Batch::BatchLogger < Logger
 
  def initialize(file_name)
    # 専用のログファイルに出力する設定. dailyでローテートさせる
    logger = Logger.new(Rails.root.join("log/batch/#{file_name}.log"), "daily")
    # 'STDOUT'を指定して標準出力に出す設定
    std_logger = Logger.new(STDOUT)
    # broadcastメソッドで複数のログを出力するmoduleを生成してextendする
    logger.extend ActiveSupport::Logger.broadcast(std_logger)
    logger
  end
end
