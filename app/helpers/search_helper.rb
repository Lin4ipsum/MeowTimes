module SearchHelper

  class Reddit
    require 'net/http'

    cattr_accessor :articles

    URL = 'https://www.reddit.com/r/subreddits/search.json?q=aww'

    def self.getArticles
      articles = self.make_article_array
    end

  private

    def self.get_data_string_from_reddit
      Net::HTTP.get(URI(URL))
    end

    def self.parse_json
      JSON.parse(self.get_data_string_from_reddit)
    end

    def self.json_children
      self.parse_json["data"]["children"]
    end

    def self.make_article_array
      list_of_articles = []
      self.json_children.each do |child|
        title = child["data"]["title"]
        thumbnail = child["data"]["thumbnail"]
        article_url = "http://www.reddit.com#{child["data"]["permalink"]}"
        list_of_articles << Article.new(title, thumbnail, article_url)
      end
      list_of_articles
    end

  end

end
