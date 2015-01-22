require 'coffee-script'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'slim'

class App < Sinatra::Base

  set :root, File.dirname(__FILE__) # You must set app root

  register Sinatra::AssetPack

  assets do
    serve '/js', from: 'app/js'
    serve '/css', from: 'app/css'
    serve '/images', from: 'app/images'

    js :app, '/js/app.js', [
      '/js/lib/**/*.js',
      '/js/vendor/**/*.js'
    ]

    css :application, '/css/application.css', [
      '/css/**/*.css'
    ]

    js_compression :jsmin
    css_compression :sass
  end

  get '/' do
    slim :index
  end
end

if __FILE__ == $0
  App.run!
end
