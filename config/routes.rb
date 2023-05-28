Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get the home page
  get "/" => "providers#home"

  #login of provider

  get "/providerLogin" => "providers#signIn"

  post "/providerlogin" => "providers#loginprovider"


  # after login admin the admin lands on admin dashboard

  get "/providerDashboard" => "providers#dashboard"

  #logout of admin on admindashboard

  delete "/logoutadmin" => 'providers#destroy'

  #Registration of a user by provider

  get "/customerregistration" => 'providers#userregister'

  post "/customerRegister" => 'providers#customerRegister'


  #Customer functionalities

  post "/customerLogin" => "customers#loginCustomer"

  get "/customerlogin" => "customers#signIn"

  get "/customerDashboard" => "customers#dashboard"

  delete "/logoutcustomer" => 'customers#destroy'

end
