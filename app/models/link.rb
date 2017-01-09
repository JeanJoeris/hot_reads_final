class Link
  attr_reader :title, :url

  def initialize(link_data)
    @title = link_data[:title]
    @url = link_data[:url]
  end
end
