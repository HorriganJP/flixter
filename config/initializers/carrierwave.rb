#config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = ENV["AWS_BUCKET"] #required
  config.aws_acl = "public-read"
  
  config.fog_credentials = {
    provider: 'AWS', #required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"], #required
  }


end
