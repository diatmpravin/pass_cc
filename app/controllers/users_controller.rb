require 'json_builder'
class UsersController < ApplicationController
  def index
    p "In index-----------------------------------------------------!!!" 
  end

  def show
    p "In show-----------------------------------------------------!!!"
    puts "Request ====>>  #{params.inspect}"
    
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
    
    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false 
    #     end
    #   end
    # end 


   puts "Json response ======> #{response}"

   render json: response
  end

  def create
    p "In create-----------------------------------------------------!!!"
    sleep 2

    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true
          code 200
          user do
            email 'test@gmail.com'
            first_name 'Shephertz'
            last_name 'test'
            phone 9856956895
            api_key 'df1dcdb0-958c-0130-9368-3c970e529c4b'
            secrete_key 'be9faaf56ff75bacae2ac9712b02c8feb8ffc6bb3381b60e1e9efccccd81086d'    
         end  
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success true
    #       code 401
    #       user do
    #         email 'test@gmail.com'
    #      end  
    #     end
    #   end
    # end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success true
    #       code 402
    #       user do
    #         email 'test@gmail.com'
    #      end  
    #     end
    #   end
    # end

    # tokens = RestClient.where(:email => params['email']).first
    puts response
    render json: response
  end

  def update
    p "In update-----------------------------------------------------!!!"
  end

  def destroy
    p "In destroy-----------------------------------------------------!!!"
  end

end
