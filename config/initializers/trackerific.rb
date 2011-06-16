require 'trackerific'

Trackerific.configure do |config|
  config.fedex  :meter    => Settings.fedex.meter,
                :account  => Settings.fedex.account
  
  config.ups    :key      => Settings.ups.key,
                :user_id  => Settings.ups.user,
                :password => Settings.ups.pass
  
  config.usps   :user_id  => Settings.usps.user
end
