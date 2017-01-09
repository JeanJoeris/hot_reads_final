class LinksController < ApplicationController
  def index
    @hot_links = LinkService.fetch_top_reads
  end
end
