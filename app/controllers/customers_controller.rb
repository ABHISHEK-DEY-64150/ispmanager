require 'erb'


class CustomersController < ApplicationController
  before_action :require_customer_logged_in ,only: [:dashboard]

    def dashboard
      puts notice
    end

    def internet

      @packages=Package.where(servicetype:"Internet")

      p "Here Goes Packages : ",@packages

      p "Testing the serviceType ",@packages[0].price
    end


    def showpackages

      @fields=Package.column_names[0...-2]
      @records = Package.all.as_json
      p "Fields here ",@fields
      p "Records here",@records
      p "Record type",@records.class

      # Sample data

      # Load and render the ERB template
      template = File.read('app/views/customers/showpackages.html.erb')
      erb = ERB.new(template)
      result = erb.result(binding)

      # Output the rendered result
      puts result

    end
    

    def loginCustomer
        customer = Customer.find_by(email:customer_login_params[:email])
        # puts ">>>>>>>>>>>>>>",provider.email
        if customer && customer.authenticate(customer_login_params[:password])
            session[:customer_id] = customer.id 
            redirect_to '/customerDashboard',notice: 'Customer Logged in successfully'
        else
          flash[:login_errors] = ['invalid credentials']
          redirect_to '/'
        end
     
    end

    def destroy
        session[:customer_id] = nil
        redirect_to '/customerlogin'
      end  

    private
    def customer_login_params
      params.require(:logincustomer).permit(:email,:password);
    end  
  
end
