CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => "AWS",
    :aws_access_key_id     => "AKIAIXFN43KQLNP34PZQ",
    :aws_secret_access_key => "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",
    :region                => "us-west-2"
  }
  config.fog_directory = "babyio"
end
