require 'sinatra/base'
require './lib/computer'
require './lib/game'

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
    session[:player_shape] = params[:player_shape].downcase.to_sym
    session[:computer_shape] = Computer.new.shape
    redirect '/outcome'
  end

  get '/outcome' do
    @game = Game.new(session)
    erb :outcome
  end

  run! if app_file == $0
end
