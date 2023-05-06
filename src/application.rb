require 'sinatra/base'

class DworldApplication < Sinatra::Application
  get '/' do
    redirect to("/login")
  end
end
