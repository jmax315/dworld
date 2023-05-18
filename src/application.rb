require 'sinatra/base'

class DworldApplication < Sinatra::Application
  enable :sessions

  get '/' do
    rack_session = env['rack.session']
    user_id = rack_session['user_id']

    if user_id
      redirect to "/view/#{user_id}"
    else
      redirect to("/login")
    end
  end
end
