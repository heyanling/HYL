class SimpleController < ApplicationController

  def index
    @title = params[:title]
    @content = params[:content]
    @file = params[:file]


  end
  def upload
    @title = params[:title1]
    @content = params[:content1]
    @image = params[:file1]


    if @title != " " && @title != nil
      @art = Article.new
      @art[:title] = @title
      @art[:content] = @content
      @art[:image_file_name] = @image
      @art.save

      session[:title] = @title
      session[:content] = @content
      session[:image] = @image

      redirect_to  :action=>'index',:title=>@title,:content=>@content,:image=>@image
   
    end

  end

  def check
    @title = session[:title]
    @content = session[:content]
    @image = session[:image]


  end

  def look(file_path)
    File.open(file_path,"r") do |file|

      　　while line  = file.gets
      　　puts line #打印出文件内容
      　　end



    end
  end
  end
