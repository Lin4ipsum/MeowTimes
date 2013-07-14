class SearchController < ApplicationController
  
  def index
    @articles = SearchHelper::Reddit::getArticles

    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

end
