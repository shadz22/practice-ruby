require 'sinatra/base'

class RPS < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    erb :play
  end

  post '/outcome' do
    session[:player_1_shape] = params[:player_1_shape]
    session[:computer_shape] = Computer.new.shape
    redirect '/outcome'
  end

  get '/outcome' do
    @player_1_shape = session[:player_1_shape]
    @computer_shape = session[:computer_shape]
    erb :outcome
  end

  run! if app_file == $0
end
