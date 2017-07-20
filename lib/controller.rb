require 'bundler'

Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
require_relative 'helpers/warden'
require 'pry'

class SlowFood < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Warden
  set :session_secret, "supersecret"

  #binding.pry
  #Create a test User
  if User.count == 0
   @user = User.create(username: "admin")
   @user.password = "admin"
   @user.save
  end

  use Warden::Manager do |config|

    config.serialize_into_session { |user| user.id }
    # Now tell Warden how to take what we've stored in the session
    # and get a User from that information.
    config.serialize_from_session { |id| User.get(id) }

    config.scope_defaults :default,
                          # "strategies" is an array of named methods with which to
                          # attempt authentication. We have to define this later.
                          strategies: [:password],
                          # The action is a route to send the user to when
                          # warden.authenticate! returns a false answer. We'll show
                          # this route below.
                          action: 'auth/unauthenticated'
    # When a user tries to log in and cannot, this specifies the
    # app to send the user to.
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env, opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  get '/' do
    @shopping_cart = Shopping_cart.new(session)
    @categories = Category.all
    @dishes = Dish.all
    @my_cart = @shopping_cart.show_cart()
    @cart_total = @shopping_cart.cart_total()

    erb :index
  end

  post '/' do
    @shopping_cart = Shopping_cart.new(session)
    dish_id = params[:dish_id]

    @shopping_cart.add_to_cart(dish_id)
    @cart_total = @shopping_cart.cart_total()

    @categories = Category.all
    @dishes = Dish.all
    @my_cart = @shopping_cart.show_cart()
    erb :index
  end

  get '/clear_cart' do
    @shopping_cart = Shopping_cart.new(session)
    @shopping_cart.clear_cart()
    redirect '/'
  end

  post '/order' do
    unless current_user
      redirect '/auth/login'
    end

    shopping_cart = Shopping_cart.new(session)
    order = Order.new
    order.user = current_user
    order.total_price = shopping_cart.cart_total
    order.order_status = 'new'
    order.order_date = DateTime.now

    shopping_cart = shopping_cart.show_cart

    shopping_cart.each do |item|
      order_item = order.order_items.new(quantity: item.quantity)
      order_item.dish = Dish.get(item.dish_id)
    end

    if order.save
      flash[:success] = "Order was placed, you can pick it up in 30 minutes <br> The total for your order is #{order.total_price} kr"
      redirect '/'
    end
  end

  get '/about' do
    erb :about
  end

  get '/auth/login' do
    erb :login
  end

  post '/auth/login' do
    env['warden'].authenticate!
    flash[:success] = "Successfully logged in #{current_user.username}"
    if session[:return_to].nil?
      redirect '/'
    else
      redirect session[:return_to]
    end
  end

  get '/auth/logout' do
    env['warden'].raw_session.inspect
    env['warden'].logout
    flash[:success] = 'Successfully logged out'
    redirect '/'
  end

  post '/auth/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    flash[:error] = env['warden.options'][:message] || 'You must log in'
    redirect '/auth/login'
  end

  get '/protected' do
    env['warden'].authenticate!

    erb :protected
  end
end
