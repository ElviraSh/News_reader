class MtvNewsController < ApplicationController
  def index
    if params[:query].present?
      fetch_mtv_news_from_api
    end
  end

  private

  def fetch_mtv_news_from_api
    url = "http://127.0.0.1:3000/mtv_news"
    uri = URI(url)

    url_params = { "query" => params[:query]}
    uri.query = URI.encode_www_form(url_params)

    @response = Net::HTTP.get(uri)
    @response = JSON.parse(@response)
  end
end
