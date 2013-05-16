require 'json_builder'
class UsersController < ApplicationController
  def index
    p "In index-----------------------------------------------------!!!" 
  end

  def show
    p "In show-----------------------------------------------------!!!"
    puts "Get Request===========> #{params.inspect}"
    
    
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true
          user do
            email 'test@gmail.com'    
	        end	
        end
      end
    end	
    
    # puts "Headers========> #{request.headers['api_key']}"
    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       message 'You have not sufficient memory for app deploy' 
    #     end
    #   end
    # end 


   puts "Json response ======> #{response}"

   render json: response
  end

  def create
    p "In create-----------------------------------------------------!!!"
   
    puts "Params ===> #{params.inspect}" 

    sleep 2

    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true
          code 200
          message 'Authentication successful.'
          user do
            email 'test@gmail.com'
            first_name 'Shephertz'
            last_name 'test'
            phone 9856956895
            api_key 'df1dcdb0-958c-0130-9368-3c970e529c4b'
            secret_key 'be9faaf56ff75bacae2ac9712b02c8feb8ffc6bb3381b60e1e9efccccd81086d'    
         end  
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Authorization failed.'  
    #     end
    #   end
    # end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 402
    #       message 'You are not authorize.'  
    #     end
    #   end
    # end


    # tokens = RestClient.where(:email => params['email']).first
    puts "Response---> #{response}"
    render json: response
  end

  def update
    p "In update-----------------------------------------------------!!!"
  end

  def destroy
    p "In destroy-----------------------------------------------------!!!"
  end

end
