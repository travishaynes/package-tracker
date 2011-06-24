# configuration to get Compass to play nicely with Heroku
# makes sure that tmp/stylesheets exists when the app starts running and that
# the stylesheets are served as static assets.

if Rails.env.production?
  require 'fileutils'
  FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))

  Compass::AppIntegration::Rails.initialize!

  Rails.configuration.middleware.delete('Sass::Plugin::Rack')
  Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

  Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
      :urls => ['/stylesheets'],
      :root => "#{Rails.root}/tmp")
end
