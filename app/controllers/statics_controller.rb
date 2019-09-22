class StaticsController < ApplicationController

  def show
    if valid_page?
      if params[:page] == "index"
        @last_articles = Article.order(creation_date: :desc).limit("6")
        puts @last_articles
      end
      render template: "statics/#{params[:page]}"
    else
      render template: "statics/404", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/statics/#{params[:page]}.html.erb"))
  end


end
