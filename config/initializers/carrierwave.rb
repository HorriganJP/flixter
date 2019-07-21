#config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = ENV["AWS_BUCKET"] #required
  config.aws_acl = "public-read"
  
  config.aws_credentials = {
    aws_access_key_id: ENV["AWS_ACCESS_KEY"], #required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"], #required
    region: ENV["AWS_REGION"]
  }


end
