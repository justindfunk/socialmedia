class HyperlinksController < ApplicationController
  respond_to :json, :only => [ :scrape ]

  def scrape
    page = MetaInspector.new(params[:url], faraday_options: { ssl: { verify: false } })
    @hyperlink = Hyperlink.new(:url => params[:url], title: page.best_title, description: page.best_description, image: page.images.best)
    puts @hyperlink.inspect
  end

  private

  def hyperlink_params
    params.require(:hyperlink).permit(:url)
  end
end