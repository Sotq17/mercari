require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'mercarimaemuki'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercarimaemuki'
end
end

# if Rails.env.production?
#  CarrierWave.configure do |config|
#    config.fog_credentials = {
#      # Configuration for Amazon S3
#      :provider              => 'AWS',
#      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
#      :aws_secret_access_key => ENV['S3_SECRET_KEY']
#    }
#    config.fog_directory     =  ENV['S3_BUCKET']
#  end
# end