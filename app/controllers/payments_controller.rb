class PaymentsController < ApplicationController
    def payment
        @unpaidpack = CustomerSubscription.find(params[:id]);
        # @pay = Payment.new 
        # @pay = Payment.new 
    end

    def paymenthistory
        @payhistory = Payment.where(customer_id: session[:customer_id]).order(created_at: :desc)
    end

    def generate_pdf
      html = render_to_string(template: 'example.pdf.erb', layout: false)
  
      pdf_file = WickedPdf.new.pdf_from_string(html)
  
      document = Document.new
      document.pdf_data = pdf_file
      document.save
  
      redirect_to document_path(document)
    end


    def download_pdf
      document = Payment.find(params[:id])
      send_data document.invoicepdf, filename: 'document.pdf', type: 'application/pdf', disposition: 'attachment'
    end

     def makePayment
              
              puts "=====subs====>",params
              # puts "ppppp--->",params[:packagedescription]
              @pay = Payment.new
              @pay.servicetype = params[:servicetype]
              @pay.packagedescription = params[:packagedescription]
              @pay.price = params[:price]
              @pay.dues = params[:dues]
              @pay.amount = params[:amount]  
              @pay.customer_id = session[:customer_id]
              customersub = CustomerSubscription.find(params[:id])
              @pay.package_id = customersub.package_id
              @pay.provider_id = customersub.provider_id
              @pay.subscription_id = params[:id]
              @pay.timestamp = Time.now
              @pay.card = params[:card]
              subtotal=@pay.dues*@pay.amount

              h1 = session[:customer_id].to_s
              h2 = params[:card].to_s
              h3 = @pay.timestamp.to_s
              h4 = @pay.amount.to_s
              h5 = @pay.dues.to_s

              combined = h1 + h2 + h3 + h4 + h5 

              hash = Digest::SHA256.hexdigest(combined)[0,10]

              @pay.txid = hash 


                
        r = Receipts::Receipt.new(
        details: [
          ["Receipt Number", hash],
          ["Date paid", Date.today],
          ["Payment method", "Online"]
        ],
        company: {
          name: "Example, LLC",
          address: "123 Fake Street\nNew York City, NY 10012",
          email: "support@example.com"
        },
        recipient: [
          "<b>Customer Details:</b>",
          ["Customer ID : #{@pay.customer_id}"],
          "Their Address",
          "City, State Zipcode",
          nil,
          "customer@example.org"
        ],
        line_items: [
          ["<b>Item</b>", "<b>Unit Cost</b>", "<b>Quantity</b>", "<b>Amount</b>"],
          ["Subscription", "$#{@pay.amount}", "#{@pay.dues}", "$#{subtotal}"],
          [nil, nil, "Subtotal", "$#{subtotal}"],
          [nil, nil, "Tax", "5%"],
          [nil, nil, "Total", "$#{subtotal*1.05}"],
          [nil, nil, "<b>Amount paid</b>", "$#{subtotal*1.05}"],
          [nil, nil, "Refunded on #{Date.today}", "$5.00"]
        ],
        footer: "Thanks for your business. Please contact us if you have any questions."
      )



              @pay.invoicepdf = r.render
      
              if @pay.save 
                duePackages = CustomerSubscription.where(id: params[:id])
                duePackages.update(dues:0)
                redirect_to "/paymenthistory",notice: 'Payment done' 


              else
                #  flash[:payment_errors] = "payment error"
                 render :payment,@pay => @pay 
              end 
    end


end
