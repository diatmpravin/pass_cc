class AppsController < ApplicationController
  def index
    puts params.inspect
    puts 'index--------------------------------------------------------------!!'
  end

  def scale
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Something wrong'   
    #     end
    #   end
    # end
    render json: response
  end  
  def descale
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Something wrong'   
    #     end
    #   end
    # end
    render json: response
  end

  def start
    puts "START--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Something wrong'   
    #     end
    #   end
    # end
    
    render json:response
    
  end

  def stop
    puts "STOP--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Something wrong'   
    #     end
    #   end
    # end
    
    render json: response
  end

  def restart
    puts "RESTART--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Something wrong'   
    #     end
    #   end
    # end

    render json: response
  end

  def info
    puts "INFO--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true
          info do
            memory 512
            framework 'rails'
            runtime 'ruby20'
            domain 'demo.app42paas.com' 
            user 'pravin mishra'
            status 'running'   
          end   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'something wrong'    
    #     end
    #   end
    # end

    render json: response 
  end

  def delete
    puts "DELETE--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'Something wrong'   
    #     end
    #   end
    # end  
  
    render json: response 
  end

  def releases
    puts "RELEASES--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true
          releases do
            version 'v1'
            email 'test@gmail.com'
            date '20/02/2010'   
          end   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'something wrong'    
    #     end
    #   end
    # end

    render json: response 
  end

  def status
    puts "STATUS--------------------------------!!"
    response = JSONBuilder::Compiler.generate do
      app42 do
        response do
          success true
          status do
            status 'running'  
          end   
        end
      end
    end

    # response = JSONBuilder::Compiler.generate do
    #   app42 do
    #     response do
    #       success false
    #       code 401
    #       message 'something wrong'    
    #     end
    #   end
    # end

    render json: response 
  end


  def show
    puts params.inspect
    puts 'show---------------------------------------------------------------!!'
  end

  def create
    puts "Post Request===========> #{params['app42']['scale'].inspect}"
    puts 'create--------------------------------------------------------------!!'
    sleep 1
    if params[:source_zip]
      puts require 'fileutils' 
      puts params[:source_zip].inspect
      puts params[:source_zip].tempfile.inspect
      tmp = params[:source_zip].tempfile
      puts params[:source_zip].original_filename
      puts file = File.join("public", params[:source_zip].original_filename)
      puts tmp
      puts tmp.path
      p 'WWWWWWWWWWWWWW'
      puts FileUtils.cp tmp.path, file
      p 'AAAAAAAAAAAAAa'
      puts FileUtils.rm tmp.path

      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true
            code 200
            message 'Done'
            app do |name|
              domain 'http://demo.app42.com'  
            end   
          end
        end
      end

      # response = JSONBuilder::Compiler.generate do
      #   app42 do
      #     response do
      #       success false
      #       code 401
      #       message 'Out of memory'   
      #     end
      #   end
      # end
      
    elsif params['app42']['request']['action'] == 'scale'
      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true   
          end
        end
      end

      # response = JSONBuilder::Compiler.generate do
      #   app42 do
      #     response do
      #       success false
      #       code 401
      #       message 'Something wrong'   
      #     end
      #   end
      # end
     
    elsif params['app42']['request']['action'] == 'descale'
      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true   
          end
        end
      end

      # response = JSONBuilder::Compiler.generate do
      #   app42 do
      #     response do
      #       success false
      #       code 401
      #       message 'Something wrong'   
      #     end
      #   end
      # end

    else
      response = JSONBuilder::Compiler.generate do
        app42 do
          response do
            success true
            code 200
            message 'Available'
            app do |name|
              domain 'http://demo.app42.com'  
            end   
          end
        end
      end

      # response = JSONBuilder::Compiler.generate do
      #   app42 do
      #     response do
      #       success true
      #       code 401
      #       message 'Not available'
      #     end
      #   end
      # end

    end 
    
    render json: response
  end

  def update
    puts params.inspect
    puts 'update----------------------------------------------------------------!!'
  end

  def destroy
    puts params.inspect
    puts 'destroy----------------------------------------------------------------!!'
  end
end
