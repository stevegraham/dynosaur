require 'sinatra'
require 'heroku'
require 'heroku/command'
require 'twilio-rb'
require 'yaml'

config = YAML.load_file './config.yaml'

module Heroku::Helpers
  def display(msg="", newline=true) msg; end
end

Heroku::Command.load

Twilio::Config.setup \
  account_sid: config['account_sid'],
  auth_token:  config['auth_token']

action = -> do
  opts     = params['Body'].split
  command  = opts.shift.strip rescue 'help'
  app_name = Twilio::IncomingPhoneNumber.all(phone_number: params['To']).first.friendly_name

  opts << '--app' << app_name

  response = Heroku::Command.run command, opts

  Twilio::TwiML.build { |res| res.sms response[0,160] }
end

get  '/', &action
post '/', &action

