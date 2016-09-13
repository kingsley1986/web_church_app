if Rails.env.production?
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
    
    config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
        :aws_secret_access_key  => ENV['S3_SECRECT'],
        :endpoint               => "https://s3.amazonaws.com",
        :region                 => ENV['S3-REGION']
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  end
end
