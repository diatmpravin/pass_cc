class AppsController < ApplicationController
  def index
    puts params.inspect
    puts 'index--------------------------------------------------------------!!'
  end

  def show
     puts params.inspect
     puts 'show---------------------------------------------------------------!!'
  end

  def create
    puts params.inspect
    puts 'create--------------------------------------------------------------!!'
    sleep 5
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
      render json: {"cdn_url" => 'www.shephertz.nixcraft.in'}
    else
      render json: {"domain" => 'http://demo.app42.com'}
    end 
    
    
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
