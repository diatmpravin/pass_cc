class ConfigController < ApplicationController
  def index
    p "In index-----------------------------------------------------!!!" 
  end

  def show
    p "In show-----------------------------------------------------!!!"
    puts "Get Request===========> #{params.inspect}"
    
    if params['id'] == 'infra'
      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true
            infra ["1 AWS-US-East Virginia", "2 AWS-EU-West Iirginia", "3 Netmagic India"] do |name|
              id, name, country = name.split(' ')
              id id
              name name
              country country  
            end   
          end
        end
      end
    end
    
    if params['id'] == 'source_type'
      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true
            source_type ["Binary"] do |name|
              name name  
            end   
          end
        end
      end
    end

    if params['id'] == 'frameworks'
      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true
            frameworks ["grails", "spring", "php", "node"] do |name|
              name name  
            end   
          end
        end
      end
    end


   puts "Json response ======> #{response}"

   render json: response
  end

  def create
    p "In create-----------------------------------------------------!!!"
  end

  def update
    p "In update-----------------------------------------------------!!!"
  end

  def destroy
    p "In destroy-----------------------------------------------------!!!"
  end
end
