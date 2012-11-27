require 'sinatra'
require 'sprockets'

get '/assets/*' do
  environment = Sprockets::Environment.new
  environment.append_path 'vendor/assets/javascripts'
  environment.append_path 'vendor/assets/stylesheets'
  environment.append_path 'vendor/assets/images'

  environment.context_class.class_eval do
    def asset_path(path, options = {})
      "/assets/#{path}"
    end
  end

  environment[params[:splat].join('/')].to_s
end


get '/' do
  erb :index
end