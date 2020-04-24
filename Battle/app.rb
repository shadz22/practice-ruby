require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
    "Welcome to Battle!"
  end


  run! if app_file == $0
end
