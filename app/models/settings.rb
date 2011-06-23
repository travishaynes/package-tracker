class Settings < Settingslogic
  source Rails.env.production? ? "#{Rails.root}/config/application.yml" : "#{Rails.root}/config/application.dev.yml"
  namespace Rails.env
end
