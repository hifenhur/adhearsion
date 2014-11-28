# encoding: utf-8

Adhearsion.config do |config|

  


  config.development do |dev|
    dev.platform.logging.level = :debug
  end

  ##
  # Use with Rayo (eg Voxeo PRISM)
  #
  # config.punchblock.username = "" # Your XMPP JID for use with Rayo
  # config.punchblock.password = "" # Your XMPP password

  ##
  # Use with Asterisk
  #
   config.punchblock.platform = :asterisk # Use Asterisk
   config.punchblock.username = "myuser" # Your AMI username
   config.punchblock.password = "mypassword" # Your AMI password
   config.punchblock.host = "localhost" # Your AMI host

   config.platform.environment = :development

 
   # ******* Configuration for reporter **************

  # The Airbrake/Errbit API key [AHN_REPORTER_API_KEY]
  config.reporter.api_key                 = "2d07c76a8f454f06f5a701b7faab3848"

  # The class that will act as the notifier. Built-in classes are Adhearsion::Reporter::AirbrakeNotifier and Adhearsion::Reporter::NewrelicNotifier [AHN_REPORTER_NOTIFIER]
  config.reporter.notifier                = Adhearsion::Reporter::AirbrakeNotifier

  # Base URL for notification service [AHN_REPORTER_URL]
  config.reporter.url                     = "http://errbit-xavante.herokuapp.com"

 
end

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  # punchblock do |event|
  #   ...
  # end
  #
  # eg Handling PeerStatus AMI events
  # ami :name => 'PeerStatus' do |event|
  #   ...
  # end
  #
end

Adhearsion.router do

#  openended do
#    route 'ConsoleCatch' do
#      logger.info "Call #{call.id} waiting..."
#    end
#  end
  route 'default', Home
end

