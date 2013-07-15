class Article
  attr_accessor :title, :thumbnail, :article_url

  def initialize(title, thumbnail, article_url)
    @title = title
    @thumbnail = thumbnail
    @article_url = article_url
  end
end