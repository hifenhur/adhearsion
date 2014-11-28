Airbrake.configure do |config|
  config.api_key = '37d3fcb7e76c321ee02e0171b075846a'
  config.host    = 'xavante-errbit.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end
