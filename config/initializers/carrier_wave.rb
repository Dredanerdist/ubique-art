CarrierWave.configure do |config|
  if Rails.env.production? # use Amazon S3
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],                        # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                        # required
    #  :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    #  :host                   => 's3.example.com',             # optional, defaults to nil
    #  :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = ENV['S3_DIR']                           # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end # else local files
end