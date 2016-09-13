# CarrierWave.configure do |config|
#   config.fog_credentials = {
#       :provider               => 'AWS',
#       :aws_access_key_id      => ENV['S3_KEY'],
#       :aws_secret_access_key  => ENV['S3_SECRECT'],
#       :endpoint               => "https://s3.amazonaws.com",
#       :region                 => ENV['S3-REGION']
#   }
#   config.fog_directory  = ENV['S3_BUCKET_NAME']
# end


if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.development?
  # Carrierwave must fail noisily in development
  CarrierWave.configure do |config|
    config.ignore_integrity_errors = false
    config.ignore_processing_errors = false
    config.ignore_download_errors = false

    config.storage = :file
    #config.asset_host = ActionController::Base.asset_host
    config.enable_processing = true
  end
end

if Rails.env.production? || Rails.env.staging?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :aws_access_key_id      => Rails.application.secrets.aws_key,
      :aws_secret_access_key  => Rails.application.secrets.aws_secret,
      :region                 => Rails.application.secrets.aws_region,
      :provider               => 'AWS',
    }

    config.fog_directory      = Rails.application.secrets.s3_bucket
    config.fog_public         = true
  end
end
