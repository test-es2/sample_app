if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        # Amazon S3用の設定
        :provider              => 'AWS',
        :region                => 'ap-northeast-1',     # 例: 'ap-northeast-1'
        :aws_access_key_id     => 'AKIA3PI4I36HRVCPWWMV',
        :aws_secret_access_key => '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'
    }
    config.fog_directory     =  'railsdb'
  end
end

