helpers do 
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end

# Routes
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end


get '/signup' do     
  @user = User.new   
  erb(:signup)
end

post '/signup' do
  
  email = params[:email]
  avatar_url = params[:avatar_url]
  username = params[:username]
  password = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    redirect to('/login')
  else
    erb(:signup)
  end
end


get "/login" do
  erb(:login)
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)

  if user && user.password == password
    session[:user_id] = user.id
    redirect to('/')
  else 
    @error_message = "Login failure is expected!"
    erb(:login)
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect to('/login')
end

before '/posts/new' do
  # ensure user is logged in, if not, direct to login
  redirect to('/login') unless logged_in?
end

get '/posts/new' do 
  @finstagram_post = FinstagramPost.new
  erb(:'posts/new')
end 

get "/posts/:id" do
  @finstagram_post = FinstagramPost.find_by({id: params[:id]})
  erb(:'posts/show')
end




















































def fizz_buzz(count, stop)
    str = ""
    while count <= stop     
        if count % 3 == 0 && count % 5 == 0
            str += "FizzBuzz"
            return fizz_buzz(count + 1, stop)
        end
        if count % 3 == 0
            str += "Fizz"
            return fizz_buzz(count + 1, stop)
        end
        if count % 5 == 0
            str += "Buzz"
            return fizz_buzz(count + 1, stop)
        end

        str += "count"
        return fizz_buzz(count + 1, stop)
    end
    str
end









get '/fizzbuzz' do
  fizz_buzz(1, 10).to_s
end
